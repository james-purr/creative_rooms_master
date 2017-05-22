class ChangeBookingReferences < ActiveRecord::Migration[5.0]
  def change
	change_table :bookings do |t|
	    t.references :homeowner
	    t.references :artist
	end
  end
end
