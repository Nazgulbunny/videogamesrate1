class RedoVideosTable < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.text :description
      t.string :attachment
      t.references :user, index: true

      t.timestamps
    end
  end
end
