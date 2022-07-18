class AddAddressToOrds < ActiveRecord::Migration[7.0]
  def change
    add_column :ords, :Address, :string
  end
end
