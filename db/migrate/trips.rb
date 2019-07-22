class CreateCreateTrips < ActiveRecord::Migration
  
  def change
    create_table :trip do |trip|
      trip.string :name 
      trip.string :destination 
      trip.string :user_id
    end 
  end
end
