class AddOauthTokenAndSecretToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_token, :string, limit:255
    add_column :users, :oauth_secret, :string, limit:255
  end
end
