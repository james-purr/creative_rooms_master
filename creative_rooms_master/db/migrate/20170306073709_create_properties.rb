class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :postcode
      t.string :description
      t.boolean :space_for_artist
      t.integer :user_id

      t.timestamps
    end
  end
end
