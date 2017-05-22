class ChangeBookingAssosciations < ActiveRecord::Migration[5.0]
  def change
    remove_column :bookings, :homeowner_id, :integer
    remove_column :bookings, :artist_id, :integer
  end


end
