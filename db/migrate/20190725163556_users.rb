class Users < ActiveRecord::Migration
  
  def change
    create_table :users do |users|
      users.string :email 
      users.string :password 
      users.string :password_digest 
    end 
  end

end