class CreateMovieActors < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_actors do |t|
      t.references :movie
      t.references :actor
      t.timestamps
    end
  end
end
