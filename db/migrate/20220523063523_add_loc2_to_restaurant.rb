class AddLoc2ToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :longitude, :decimal
  end
end
