class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :release_date
      t.string :developer
      t.string :publisher
      t.string :logo
      t.string :cover
      t.string :platform

      t.timestamps null: false
    end
  end
end
