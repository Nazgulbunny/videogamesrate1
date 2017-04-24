class AddCachedVotesToVideos < ActiveRecord::Migration[5.1]
  def change
    add_column :videos, :cached_votes_up, :integer, :default => 0
    add_index  :videos, :cached_votes_up
  end
end
