class AddFavoriteToArtworkShare < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :favorite, :Boolean
  end
end
