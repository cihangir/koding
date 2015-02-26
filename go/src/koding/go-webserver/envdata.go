package main

import (
	"errors"
	"koding/db/mongodb/modelhelper"

	"labix.org/v2/mgo/bson"
)

type EnvData struct {
	Own           []*MachineAndWorkspaces `json:"own"`
	Shared        []*MachineAndWorkspaces `json:"shared"`
	Collaboration []*MachineAndWorkspaces `json:"collaboration"`
}

type MachineAndWorkspaces struct {
	Machine    *modelhelper.MachineContainer     `json:"machine"`
	Workspaces []*modelhelper.WorkspaceContainer `json:"workspaces"`
}

func fetchEnvData(userInfo *UserInfo, outputter *Outputter) {
	envData := getEnvData(userInfo)
	outputter.OnItem <- &Item{Name: "EnvData", Data: envData}
}

func getEnvData(userInfo *UserInfo) *EnvData {
	var collab []*MachineAndWorkspaces
	var userId = userInfo.UserId

	socialApiId := userInfo.SocialApiId
	if socialApiId != "" {
		collab = getCollab(userId, socialApiId)
	}

	return &EnvData{
		Own:           getOwn(userId),
		Shared:        getShared(userId),
		Collaboration: collab,
	}
}

func getOwn(userId bson.ObjectId) []*MachineAndWorkspaces {
	ownMachines, err := modelhelper.GetOwnMachines(userId)
	if err != nil {
		Log.Error(err.Error())
		return nil
	}

	return getWorkspacesForEachMachine(ownMachines)
}

func getShared(userId bson.ObjectId) []*MachineAndWorkspaces {
	sharedMachines, err := modelhelper.GetSharedMachines(userId)
	if err != nil {
		Log.Error(err.Error())
		return nil
	}

	return getWorkspacesForEachMachine(sharedMachines)
}

func getCollab(userId bson.ObjectId, socialApiId string) []*MachineAndWorkspaces {
	machines, err := modelhelper.GetCollabMachines(userId)
	if err != nil {
		Log.Error(err.Error())
		return nil
	}

	channelIds, err := getCollabChannels(socialApiId)
	if err != nil {
		Log.Error(err.Error())
		return nil
	}

	workspaces, err := modelhelper.GetWorkspacesContainersByChannelIds(channelIds)
	if err != nil {
		Log.Error(err.Error())
		return nil
	}

	mwByMachineUids := map[string]*MachineAndWorkspaces{}
	for _, machine := range machines {
		mwByMachineUids[machine.Uid] = &MachineAndWorkspaces{
			Machine: machine, Workspaces: []*modelhelper.WorkspaceContainer{},
		}
	}

	for _, workspace := range workspaces {
		mw, ok := mwByMachineUids[workspace.MachineUID]
		if ok {
			mw.Workspaces = append(mw.Workspaces, workspace)
		}
	}

	mws := []*MachineAndWorkspaces{}
	for _, machineWorkspace := range mwByMachineUids {
		mws = append(mws, machineWorkspace)
	}

	return mws
}

func getWorkspacesForEachMachine(machines []*modelhelper.MachineContainer) []*MachineAndWorkspaces {
	mws := []*MachineAndWorkspaces{}

	for _, machine := range machines {
		machineAndWorkspace := &MachineAndWorkspaces{Machine: machine}

		workspaces, err := modelhelper.GetWorkspacesContainers(machine.Machine)
		if err == nil {
			machineAndWorkspace.Workspaces = workspaces
		} else {
			Log.Error(err.Error())
		}

		mws = append(mws, machineAndWorkspace)
	}

	return mws
}

func getCollabChannels(socialApiId string) ([]string, error) {
	path := "%v/privatechannel/list?accountId=%[2]s"
	url := buildUrl(path, socialApiId, "type=collaboration")

	rawResponse, err := fetchSocialItem(url)
	if err != nil {
		return nil, err
	}

	response, ok := rawResponse.([]interface{})
	if !ok {
		return nil, errors.New("error unmarshalling repsonse")
	}

	channelIds := []string{}
	for _, single := range response {
		raw, ok := single.(map[string]interface{})
		if !ok {
			continue
		}

		channel, ok := raw["channel"].(map[string]interface{})
		if !ok {
			continue
		}

		id, ok := channel["id"].(string)
		if !ok {
			continue
		}

		channelIds = append(channelIds, id)
	}

	return channelIds, nil
}
