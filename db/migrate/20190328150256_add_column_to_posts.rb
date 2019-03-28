class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :live_name, :string
    add_column :posts, :day, :string
    add_column :posts, :time, :string
    add_column :posts, :place, :text
    add_column :posts, :money, :text
    add_column :posts, :contact, :text
  end
end
