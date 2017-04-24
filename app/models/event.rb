class Event < ApplicationRecord
  include Shared::Callbacks
  belongs_to :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }

  validates_presence_of :name
  validates_presence_of :when
  validates_presence_of :user

  # Search
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
