class AddMovieIdToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :movie_id, :integer
  end
end
