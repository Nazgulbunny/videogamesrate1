class Video < ApplicationRecord
  belongs_to :user

  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

	mount_uploader :attachment, VideoUploader

  # Validations
  validates_presence_of :description
  validates_presence_of :attachment
  validates_presence_of :user

  # Search
  def self.search(search)
    where("description LIKE ?", "%#{search}%")
  end
end
