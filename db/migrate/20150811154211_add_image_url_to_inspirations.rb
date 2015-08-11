class AddImageUrlToInspirations < ActiveRecord::Migration
  def change
    add_column :inspirations, :image_url, :string
  end
end
