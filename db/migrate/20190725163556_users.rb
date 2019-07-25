class Users < ActiveRecord::Migration
  
  def change
    create_table :users do |users|
      users.string :email 
      users.string :password_digest 
      users.integer :user_id
    end 
  end

end