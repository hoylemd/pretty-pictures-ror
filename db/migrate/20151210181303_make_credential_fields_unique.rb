class MakeCredentialFieldsUnique < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, unique: true
    change_column :users, :token, :string, unique: true
    change_column :users, :secret, :string, unique: true
  end
end
