class FixYourShit < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
    	
      t.attachment :file
      t.string :description

      t.timestamps
    end
    
  	add_reference :photos, :experience, index: true  	
  end
end
