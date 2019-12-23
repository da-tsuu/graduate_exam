class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :content
      t.text :image
      t.string :youtube_url

      t.timestamps
    end
  end
end
