class RemoveExtraFields < ActiveRecord::Migration
  def change
  	remove_column :media, :title, :place, :time
  end
end
