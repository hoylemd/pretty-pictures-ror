class AddLengthRestrictionsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, limit: 63
    change_column :users, :token, :string, limit: 63
    change_column :users, :secret, :string, limit: 63
    change_column :users, :bio, :string, limit: 255
  end
end
