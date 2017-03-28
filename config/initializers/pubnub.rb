# Init. PubNub client
$pubnub = Pubnub.new(
	subscribe_key: Rails.application.secrets.pubnub_subscribe_key,
	publish_key: Rails.application.secrets.pubnub_publish_key,
	secret_key: Rails.application.secrets.pubnub_secret_key,
	auth_key: Rails.application.secrets.pubnub_auth_key
)

# Grand access to channels

# -- grants `read` rights to any channel that begins with 'video.' to all clients
$pubnub.grant(
	read: true,
	write: false,
	auth_key: nil,
	channel: 'video.*',
	http_sync: true,
	ttl: 0
)

# -- grants `read` and `write` rights to any channel that begins with 'video'
#    to all clients
$pubnub.grant(
	read: true,
	write: true,
	auth_key: Rails.application.secrets.pubnub_auth_key,
	channel: 'video.*',
	http_sync: true,
	ttl: 0
)

# -- grants `read` and `write` rights to any channel that begins with
#    `notification` to the current clients
$pubnub.grant(
	read: true,
	write: true,
	auth_key: Rails.application.secrets.pubnub_auth_key,
	channel: 'notifications.*',
	http_sync: true,
	ttl: 0
)
