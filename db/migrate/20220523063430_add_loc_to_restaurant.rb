class AddLocToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :latitude, :decimal
  end
end
