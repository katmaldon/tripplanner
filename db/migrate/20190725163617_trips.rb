class Trips < ActiveRecord::Migration
  def change
    create_table :trip do |trip|
      trip.string :name 
      trip.string :destination 
      trip.integer :user_id
    end 
  end
end