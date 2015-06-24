class ChangeColumnExperience < ActiveRecord::Migration
  def change
    change_column :experiences, :sphere,  :text
  end
end
