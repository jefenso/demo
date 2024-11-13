class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, null: false, default: 0
    add_column :users, :name, :string
  end
end
