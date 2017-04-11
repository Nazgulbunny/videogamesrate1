class Video < ActiveRecord::Base
  belongs_to :user

  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

	mount_uploader :attachment, PostUploader
end
