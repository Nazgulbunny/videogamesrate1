class AddGenreAndLinkToGames < ActiveRecord::Migration
  def change
    add_column :games, :genre, :string
    add_column :games, :webpage, :string
  end
end
