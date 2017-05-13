class AddRoomIdToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :room_id, :integer
  end
end
