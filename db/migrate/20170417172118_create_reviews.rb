class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.string :video_review

      t.references :user, index: true
      t.references :game, index: true

      t.timestamps null: false
    end
  end
end
