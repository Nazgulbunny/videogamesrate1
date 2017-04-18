class Game < ActiveRecord::Base
  # References
  has_many :reviews

  # Uploaders
  mount_uploader :logo, AvatarUploader
  mount_uploader :cover, CoverUploader

  # Gems
  acts_as_votable
  acts_as_commentable
  ratyrate_rateable "game"

  # validation
  validates_presence_of :title
  validates_presence_of :release_date
  validates_presence_of :developer
  validates_presence_of :publisher
  validates_presence_of :logo
  validates_presence_of :cover
  validates_presence_of :platform
  validates_presence_of :genre

end
