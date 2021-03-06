package compute_provider

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"fmt"
	"io"

	"github.com/go-openapi/runtime"

	strfmt "github.com/go-openapi/strfmt"

	"koding/remoteapi/models"
)

// PostRemoteAPIComputeProviderCreateGroupStackReader is a Reader for the PostRemoteAPIComputeProviderCreateGroupStack structure.
type PostRemoteAPIComputeProviderCreateGroupStackReader struct {
	formats strfmt.Registry
}

// ReadResponse reads a server response into the received o.
func (o *PostRemoteAPIComputeProviderCreateGroupStackReader) ReadResponse(response runtime.ClientResponse, consumer runtime.Consumer) (interface{}, error) {
	switch response.Code() {

	case 200:
		result := NewPostRemoteAPIComputeProviderCreateGroupStackOK()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return result, nil

	case 401:
		result := NewPostRemoteAPIComputeProviderCreateGroupStackUnauthorized()
		if err := result.readResponse(response, consumer, o.formats); err != nil {
			return nil, err
		}
		return nil, result

	default:
		return nil, runtime.NewAPIError("unknown error", response, response.Code())
	}
}

// NewPostRemoteAPIComputeProviderCreateGroupStackOK creates a PostRemoteAPIComputeProviderCreateGroupStackOK with default headers values
func NewPostRemoteAPIComputeProviderCreateGroupStackOK() *PostRemoteAPIComputeProviderCreateGroupStackOK {
	return &PostRemoteAPIComputeProviderCreateGroupStackOK{}
}

/*PostRemoteAPIComputeProviderCreateGroupStackOK handles this case with default header values.

Request processed successfully
*/
type PostRemoteAPIComputeProviderCreateGroupStackOK struct {
	Payload *models.DefaultResponse
}

func (o *PostRemoteAPIComputeProviderCreateGroupStackOK) Error() string {
	return fmt.Sprintf("[POST /remote.api/ComputeProvider.createGroupStack][%d] postRemoteApiComputeProviderCreateGroupStackOK  %+v", 200, o.Payload)
}

func (o *PostRemoteAPIComputeProviderCreateGroupStackOK) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.DefaultResponse)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}

// NewPostRemoteAPIComputeProviderCreateGroupStackUnauthorized creates a PostRemoteAPIComputeProviderCreateGroupStackUnauthorized with default headers values
func NewPostRemoteAPIComputeProviderCreateGroupStackUnauthorized() *PostRemoteAPIComputeProviderCreateGroupStackUnauthorized {
	return &PostRemoteAPIComputeProviderCreateGroupStackUnauthorized{}
}

/*PostRemoteAPIComputeProviderCreateGroupStackUnauthorized handles this case with default header values.

Unauthorized request
*/
type PostRemoteAPIComputeProviderCreateGroupStackUnauthorized struct {
	Payload *models.UnauthorizedRequest
}

func (o *PostRemoteAPIComputeProviderCreateGroupStackUnauthorized) Error() string {
	return fmt.Sprintf("[POST /remote.api/ComputeProvider.createGroupStack][%d] postRemoteApiComputeProviderCreateGroupStackUnauthorized  %+v", 401, o.Payload)
}

func (o *PostRemoteAPIComputeProviderCreateGroupStackUnauthorized) readResponse(response runtime.ClientResponse, consumer runtime.Consumer, formats strfmt.Registry) error {

	o.Payload = new(models.UnauthorizedRequest)

	// response payload
	if err := consumer.Consume(response.Body(), o.Payload); err != nil && err != io.EOF {
		return err
	}

	return nil
}
