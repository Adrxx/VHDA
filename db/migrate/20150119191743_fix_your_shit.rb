class FixYourShit < ActiveRecord::Migration
  def change
  	add_reference :media, :experience, index: true  	
  end
end
