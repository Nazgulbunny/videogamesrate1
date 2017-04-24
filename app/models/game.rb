class Game < ApplicationRecord
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

  # Search
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("developer LIKE ?", "%#{search}%")
    where("publisher LIKE ?", "%#{search}%")
    where("platform LIKE ?", "%#{search}%")
    where("genre LIKE ?", "%#{search}%")
  end

end
