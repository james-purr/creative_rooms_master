class AddFeaturedToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :featured, :boolean
  end
end
