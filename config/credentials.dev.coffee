module.exports = (options) ->
  dev_master =
    accessKeyId: "AKIAIKQZE7JIXVGIT2MA"
    secretAccessKey: "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"

  awsKeys =
    dev_master: dev_master
    # s3 full access
    worker_terraformer: dev_master
    # s3 put only to koding-client bucket
    worker_koding_client_s3_put_only: dev_master
    # admin
    worker_test: dev_master
    # s3 put only
    worker_test_data_exporter: dev_master
    # AmazonRDSReadOnlyAccess
    worker_rds_log_parser: dev_master
    # ELB & EC2 -> AmazonEC2ReadOnlyAccess
    worker_multi_ssh: dev_master
    # AmazonEC2FullAccess
    worker_test_instance_launcher: dev_master
    # TunnelProxyPolicy
    worker_tunnelproxymanager: dev_master # Name worker_tunnelproxymanager_dev
    #Encryption and Storage on S3
    worker_sneakerS3 : dev_master
    vm_vmwatcher:     # vm_vmwatcher_dev
      accessKeyId: "AKIAJ3OZKOIQUTV2GCBQ"
      secretAccessKey: "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"
    vm_kloud:         # vm_kloud_dev
      accessKeyId: "AKIAJRNT55RTV2MHD4VA"
      secretAccessKey: "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"

  slKeys =
    vm_kloud:
      username: "IBM839677"
      apiKey: "1664173c843a22d223247837da5cab6d4de7d06f238606e1523458d59eca72d0"
  mongo = "#{options.serviceHost}:27017/koding"
  redis =
    host: "#{options.serviceHost}"
    port: "6379"
    db: 0
    url : "#{options.serviceHost}:6379"
  monitoringRedis = redis
  rabbitmq =
    host: "#{options.serviceHost}"
    port: 5672
    apiAddress: "#{options.serviceHost}"
    apiPort: "15672"
    login: "guest"
    componentUser: "guest"
    password: "guest"
    heartbeat: 10
    vhost: "/"
  algolia =
    appId: 'DYVV81J2S1'
    apiSecretKey: '682e02a34e2a65dc774f5ec355ceca33'
    apiSearchOnlyKey: '8dc0b0dc39282effe9305981d427fec7'
  postgres =
    host: "#{options.serviceHost}"
    port: "5432"
    username: "socialapp201506"
    password: "socialapp201506"
    dbname: "social"
  kontrolPostgres =
    host: "#{options.serviceHost}"
    port: 5432
    username: "kontrolapp201506"
    password: "kontrolapp201506"
    dbname: "social"
    connecttimeout: 20
  pubnub =
    publishkey: "pub-c-5b987056-ef0f-457a-aadf-87b0488c1da1"
    subscribekey: "sub-c-70ab5d36-0b13-11e5-8104-0619f8945a4f"
    secretkey: "sec-c-MWFhYTAzZWUtYzg4My00ZjAyLThiODEtZmI0OTFkOTk0YTE0"
    serverAuthKey: "46fae3cc-9344-4edb-b152-864ba567980c7960b1d8-31dd-4722-b0a1-59bf878bd551"
    origin: "pubsub.pubnub.com"
    enabled:  yes
    ssl: no
  terraformer =
    port : 2300
    bucket: "kodingdev-terraformer-state-#{options.configName}"
    localstorepath:  "#{options.projectRoot}/go/data/terraformer"
  paymentwebhook =
    customersKey: 'R1PVxSPvjvDSWdlPRVqRv8IdwXZB'
    secretKey: "paymentwebhooksecretkey-#{options.configName}"
  tokbox =
    apiKey: "45253342"
    apiSecret: "e834f7f61bd2b3fafc36d258da92413cebb5ce6e"
  googleapiServiceAccount =
    clientId: "1044469742845-kaqlodvc8me89f5r6ljfjvp5deku4ee0.apps.googleusercontent.com"
    clientSecret: "8-gOw1ckGNW2bDgdxPHGdQh7"
    serviceAccountEmail: "1044469742845-kaqlodvc8me89f5r6ljfjvp5deku4ee0@developer.gserviceaccount.com"
    serviceAccountKeyFile: "#{options.projectRoot}/keys/KodingCollaborationDev201506.pem"
  github =
    clientId: "f8e440b796d953ea01e5"
    clientSecret: "b72e2576926a5d67119d5b440107639c6499ed42"
    redirectUri: "http://dev.koding.com:8090/-/oauth/github/callback"
  odesk =
    key: "7872edfe51d905c0d1bde1040dd33c1a"
    secret: "746e22f34ca4546e"
    request_url: "https://www.upwork.com/api/auth/v1/oauth/token/request"
    access_url: "https://www.upwork.com/api/auth/v1/oauth/token/access"
    secret_url: "https://www.upwork.com/services/api/auth?oauth_token="
    version: "1.0"
    signature: "HMAC-SHA1"
    redirect_uri: "http://dev.koding.com:8090/-/oauth/odesk/callback"
  facebook =
    clientId: "1408510959475637"
    clientSecret: "bf837bc719dc63c870ac77f9c76fe26d"
    redirectUri: "http://dev.koding.com:8090/-/oauth/facebook/callback"
  mailgun =
    domain: "koding.com"
    privateKey: "key-6d4a0c191866434bf958aed924512758"
    publicKey: "pubkey-dabf6c392b39cce9bce12e9a582ad051"
    unsubscribeURL: "https://api.mailgun.net/v3/koding.com/unsubscribes"
  slack =
    clientId: "2155583316.22363498641"
    clientSecret: "fc61c7db5a3acd2dfbe808ba73b1002a"
    redirectUri: "http://dev.koding.com:8090/api/social/slack/oauth/callback"
    verificationToken: "jldPRk6HmOL2FjeXZYwUdW6B"
  google =
    client_id: "569190240880-d40t0cmjsu1lkenbqbhn5d16uu9ai49s.apps.googleusercontent.com"
    client_secret: "9eqjhOUgnjOOjXxfn6bVzXz-"
    redirect_uri: "http://dev.koding.com:8090/-/oauth/google/callback"
  twitter =
    key: "aFVoHwffzThRszhMo2IQQ"
    secret: "QsTgIITMwo2yBJtpcp9sUETSHqEZ2Fh7qEQtRtOi2E"
    redirect_uri: "http://dev.koding.com:8090/-/oauth/twitter/callback"
    request_url: "https://twitter.com/oauth/request_token"
    access_url: "https://twitter.com/oauth/access_token"
    secret_url: "https://twitter.com/oauth/authenticate?oauth_token="
    version: "1.0"
    signature: "HMAC-SHA1"
  linkedin =
    client_id: "7523x9y261cw0v"
    client_secret: "VBpMs6tEfs3peYwa"
    redirect_uri: "http://dev.koding.com:8090/-/oauth/linkedin/callback"
  datadog =
    api_key: "1daadb1d4e69d1ae0006b73d404e527b"
    app_key: "aecf805ae46ec49bdd75e8866e61e382918e2ee5"
  embedly =
    apiKey: "537d6a2471864e80b91d9f4a78384873"
  iframely =
    apiKey: "157f8f72ac846689f47865"
    url: 'http://iframe.ly/api/oembed'
  rollbar = "71c25e4dc728431b88f82bd3e7a600c9"
  siftScience = '2b62c0cbea188dc6'
  siftSciencePublic = '91f469711c'
  jwt =
    secret: "71c25e4dc728431b88f82bd3e7a600c9"
    confirmExpiresInMinutes: 10080
  papertrail =
    destination: 'logs3.papertrailapp.com:13734'
    groupId: 2199093
    token: '4p4KML0UeU4ijb0swx'
  helpscout =
    apiKey: 'b041e4da61c0934cb73d47e1626098430738b049'
    baseUrl: 'https://api.helpscout.net/v1'
  sneakerS3 =
    awsSecretAccessKey: "#{awsKeys.worker_sneakerS3.secretAccessKey}"
    awsAccessKeyId: "#{awsKeys.worker_sneakerS3.accessKeyId}"
    sneakerS3Path: "s3://kodingdev-credential/"
    sneakerMasterKey: "fecea2c8-e569-4d87-9179-8e7c93253072"
    awsRegion: "us-east-1"
  stripe =
    secretToken: 'sk_test_LLE4fVGK2zY3By3gccUYCLCw'
    publicToken: 'pk_test_2x9UxMl1EBdFtwT5BRfOHxtN'
  recaptcha =
    secret: "6Ld8wwkTAAAAAJoSJ07Q_6ysjQ54q9sJwC5w4xP_"
    public: "6Ld8wwkTAAAAAArpF62KStLaMgiZvE69xY-5G6ax"
  paypal =
    username: 'senthil+1_api1.koding.com'
    password: 'EUUPDYXX5EBZFGPN'
    signature: 'APp0PS-Ty0EAKx39nQi9zq9l6qgIAWb9YAF9AgXPK4-XeR7EAeeJSvnM'
    returnUrl: "#{options.customDomain.public}/-/payments/paypal/return"
    cancelUrl: "#{options.customDomain.public}/-/payments/paypal/cancel"
    isSandbox: yes
    formUrl: 'https://www.sandbox.paypal.com/incontext'
  janitor =
    port: "6700"
    secretKey: "janitorsecretkey-dev"
  vmwatcher =
    secretKey: "vmwatchersecretkey-#{options.configName}"
  helpscout =
    apiKey: 'b041e4da61c0934cb73d47e1626098430738b049'
    baseUrl: 'https://api.helpscout.net/v1'
  recurly =
    apiKey: "4a0b7965feb841238eadf94a46ef72ee"
    loggedRequests: "/^(subscriptions|transactions)/"
  segment = 'kb2hfdgf20'
  kontrol =
    publicKeyFile: "#{options.projectRoot}/certs/test_kontrol_rsa_public.pem"
    privateKeyFile: "#{options.projectRoot}/certs/test_kontrol_rsa_private.pem"
  kloud =
    userPrivateKeyFile: "./certs/kloud/dev/kloud_dev_rsa.pem"
    userPublicKeyfile: "./certs/kloud/dev/kloud_dev_rsa.pub"
    privateKeyFile: kontrol.privateKeyFile
    publicKeyFile: kontrol.publicKeyFile
    secretKey: "J7suqUXhqXeiLchTrBDvovoJZEBVPxncdHyHCYqnGfY4HirKCe"

  return {
    awsKeys
    slKeys
    mongo
    redis
    monitoringRedis
    rabbitmq
    algolia
    postgres
    kontrolPostgres
    pubnub
    terraformer
    paymentwebhook
    tokbox
    googleapiServiceAccount
    github
    odesk
    facebook
    mailgun
    slack
    google
    twitter
    linkedin
    datadog
    embedly
    iframely
    rollbar
    siftScience
    siftSciencePublic
    jwt
    papertrail
    helpscout
    sneakerS3
    stripe
    recaptcha
    paypal
    janitor
    helpscout
    recurly
    segment
    kontrol
    kloud
    vmwatcher
  }