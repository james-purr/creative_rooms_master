class CreateRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_images do |t|

      t.timestamps
    end
  end
end
