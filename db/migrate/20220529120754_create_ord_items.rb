class CreateOrdItems < ActiveRecord::Migration[7.0]
  def change
    create_table :ord_items do |t|
      t.string :menu
      t.integer :quantity
      t.references :ord, null: false, foreign_key: true

      t.timestamps
    end
  end
end
