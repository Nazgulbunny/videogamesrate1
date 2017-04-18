class Review < ActiveRecord::Base
  # References
  belongs_to :user
  belongs_to :game

  acts_as_commentable

  mount_uploader :video_review, VideoUploader
end
