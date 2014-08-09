class AddUserIdToMems < ActiveRecord::Migration
  def change
    add_column :mems, :user_id, :integer
    add_index :mems, :user_id
  end
end
