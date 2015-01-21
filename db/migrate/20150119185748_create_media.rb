class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      
      t.string :title
      t.text :description
      t.timestamp :time
      t.string :place
      t.attachment :file

      t.timestamps
    end
  end
end
