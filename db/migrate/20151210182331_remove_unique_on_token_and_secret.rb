class RemoveUniqueOnTokenAndSecret < ActiveRecord::Migration
  def change
    change_column :users, :token, :string, unique: false
    change_column :users, :secret, :string, unique: false
  end
end
