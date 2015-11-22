class RemoveGroupIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :group_id, :string
    add_foreign_key :groups, :users
    add_column :groups, :group_member_id, :string 
  end
end
