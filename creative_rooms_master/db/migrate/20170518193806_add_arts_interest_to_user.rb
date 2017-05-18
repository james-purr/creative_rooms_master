class AddArtsInterestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :arts_interest, :integer
  end
end
