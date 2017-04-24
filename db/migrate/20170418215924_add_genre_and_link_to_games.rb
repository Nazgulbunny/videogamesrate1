class AddGenreAndLinkToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :genre, :string
    add_column :games, :webpage, :string
  end
end
