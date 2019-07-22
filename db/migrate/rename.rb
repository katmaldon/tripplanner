class Rename < ActiveRecord::Migration
  def change
    rename_table :trip, :trips 
  end
end
