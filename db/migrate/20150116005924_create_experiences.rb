class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
    	
      t.string :title
      t.text :description
      t.string :place
      t.string :sphere
      t.string :date

      t.timestamps
    end
  end
end
