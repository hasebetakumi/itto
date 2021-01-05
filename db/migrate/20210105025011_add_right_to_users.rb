class AddRightToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :right, :boolean, default: false, null: false
  end
end
