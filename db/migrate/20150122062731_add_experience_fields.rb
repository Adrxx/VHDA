class AddExperienceFields < ActiveRecord::Migration
  def change
  	add_column :experiences, :time, :sphere
  end
end
