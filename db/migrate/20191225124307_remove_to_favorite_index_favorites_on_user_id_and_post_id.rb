class RemoveToFavoriteIndexFavoritesOnUserIdAndPostId < ActiveRecord::Migration[5.2]
  def change
    remove_index :favorites, column: [:user_id, :post_id]
  end
end
