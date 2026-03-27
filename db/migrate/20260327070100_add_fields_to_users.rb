class AddFieldsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_reference :users, :province, null: false, foreign_key: true
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :postal_code, :string
    add_column :users, :admin, :boolean
  end
end
