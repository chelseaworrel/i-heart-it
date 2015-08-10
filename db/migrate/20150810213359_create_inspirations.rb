class CreateInspirations < ActiveRecord::Migration
  def change
    create_table :inspirations do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
