class FixYourShit < ActiveRecord::Migration
  def change
  	add_reference :photos, :experience, index: true  	
  end
end
