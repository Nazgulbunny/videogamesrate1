class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

	after_create :gen_auth_and_grant_perms

  acts_as_voter
  acts_as_follower
  acts_as_followable

	# Association declaration
  has_many :posts
  has_many :comments
  has_many :events
	has_many :videos

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, AvatarUploader

  validates_presence_of :name

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

	# PubNub config
	def notification_channel
		"notification.#{self.id}"
	end


	def gen_auth_and_grant_perms
	  generate_pn_auth!
	  $pubnub.grant(
	    channel: notification_channel,
	    auth_key: pn_auth_key,
	    ttl: 0,
	    http_sync: true
	  )
	end

	def generate_pn_auth
	  self.pn_auth_key = SecureRandom.hex
	end

	def generate_pn_auth!
	  self.generate_pn_auth
	  save
	end
end
