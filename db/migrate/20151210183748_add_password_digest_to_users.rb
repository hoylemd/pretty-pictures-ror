class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string, limit: 255
    add_column :users, :password_salt, :string, limit: 255
  end
end
