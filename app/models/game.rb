class Game < ActiveRecord::Base
  mount_uploader :logo, AvatarUploader
  mount_uploader :cover, CoverUploader

  acts_as_votable
  acts_as_commentable
  ratyrate_rateable "game"

end
