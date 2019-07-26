class Trips < ActiveRecord::Migration
  def change
    create_table :trips do |trip|
      trip.string :name 
      trip.string :destination 
      trip.integer :user_id
    end 
  end
end