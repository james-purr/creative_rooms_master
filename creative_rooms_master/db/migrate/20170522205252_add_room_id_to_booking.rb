class AddRoomIdToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :room_id, :integer
  end
end
