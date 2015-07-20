class RenameColumnXinUserstoZ < ActiveRecord::Migration
  def change
    rename_column :users, :user_name, :nickname
    rename_column :users, :image_url, :image
    rename_column :users, :website_url, :website
  end
end
