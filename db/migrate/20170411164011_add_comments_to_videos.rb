class AddCommentsToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :comments_count, :integer, :default => 0
    add_index  :videos, :comments_count
  end
end
