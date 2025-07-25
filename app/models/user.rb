class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  acts_as_follower
  acts_as_followable

  ratyrate_rater
  ratyrate_rateable "player"

	# Association declaration
  has_many :posts
  has_many :comments
  has_many :events
	has_many :videos
  has_many :reviews, dependent: :destroy # If a user is deleted, all it's reviews will also be deleted
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover, CoverUploader

  validates_presence_of :username

  self.per_page = 10

  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  # Search
  def self.search(search)
    where("username LIKE ?", "%#{search}%")
  end
end
