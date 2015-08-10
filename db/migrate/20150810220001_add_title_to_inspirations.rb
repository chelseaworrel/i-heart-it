class AddTitleToInspirations < ActiveRecord::Migration
  def change
    add_column :inspirations, :title, :string
  end
end
