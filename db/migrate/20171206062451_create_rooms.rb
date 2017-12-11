class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.string :slug

      t.timestamps
    end
  end
end
