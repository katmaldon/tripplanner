class Trips < ActiveRecord::Migration
  def change
    create_table :trips do |trip|
      trip.string :name 
      trip.string :destination 
      trip.string :date
      trip.integer :user_id
    end 
  end
end