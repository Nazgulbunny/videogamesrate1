class AddCommentsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :comments_count, :integer, :default => 0
    add_index  :reviews, :comments_count
  end
end
