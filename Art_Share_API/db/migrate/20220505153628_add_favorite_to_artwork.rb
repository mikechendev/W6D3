class AddFavoriteToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite, :Boolean
  end
end
