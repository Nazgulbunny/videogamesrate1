class Review < ActiveRecord::Base
  # References
  belongs_to :user
  belongs_to :game

  mount_uploader :video_review, VideoUploader
end
