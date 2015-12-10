class AddDefaultToUsersBio < ActiveRecord::Migration
  def change
    change_column :users, :bio, :string, :default => ""
  end
end
