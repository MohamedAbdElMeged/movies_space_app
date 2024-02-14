class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :description 
      t.integer :year
      t.string :filming_location
      t.string :country
      t.string :director
      t.decimal :rating_overview, default: 0.0
      t.timestamps
    end
  end
end
