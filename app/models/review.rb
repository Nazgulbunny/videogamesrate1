class Review < ActiveRecord::Base
  # References
  belongs_to :user
  belongs_to :game
end
