class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :token
      t.string :secret
      t.string :bio

      t.timestamps null: false
    end
  end
end
