class Review < ApplicationRecord
  # References
  belongs_to :user
  belongs_to :game

  acts_as_commentable

  mount_uploader :video_review, VideoUploader

  # Validations
  validates_presence_of :rating
  validates_presence_of :comment
  validates_presence_of :user
  validates_presence_of :game

end
