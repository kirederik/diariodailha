class AddIndexToAlbumId < ActiveRecord::Migration
  def change
    add_index :photos, :album_id
  end
end
