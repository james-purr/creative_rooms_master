class ChangeArtsInterestToString < ActiveRecord::Migration[5.0]
  def change
	change_column :users, :arts_interest, :text
  end
end
