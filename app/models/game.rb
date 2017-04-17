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

end
