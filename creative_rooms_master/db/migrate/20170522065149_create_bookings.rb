class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :start_date
      t.string :end_date
      t.integer :artist_id
      t.integer :homeowner_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
