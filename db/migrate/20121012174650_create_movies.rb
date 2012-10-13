class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title
      t.string  :original_title
      t.integer :year
      t.decimal :rating, precision: 2, scale: 1
      t.string  :resolution
      t.string  :genre
      t.boolean :watched, default: false
      t.string  :storage
      t.string  :imdb_url
      t.string  :image_url

      t.timestamps
    end
    
    add_index :movies, :title
    add_index :movies, :original_title
    add_index :movies, :genre
    add_index :movies, :storage
  end
end
