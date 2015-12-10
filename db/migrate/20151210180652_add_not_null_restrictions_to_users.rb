class AddNotNullRestrictionsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, null: false
    change_column :users, :bio, :string, null: false
  end
end
