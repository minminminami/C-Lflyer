class AddUsersColumnsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :header_image, :string
    add_column :users, :area, :string
    add_column :users, :user_about, :text
    add_column :users, :user_url, :text
  end
end
