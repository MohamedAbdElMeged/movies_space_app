class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :review
      t.integer :stars
      t.string :user
      t.references :movie
      t.timestamps
    end
  end
end
