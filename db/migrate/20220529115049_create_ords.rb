class CreateOrds < ActiveRecord::Migration[7.0]
  def change
    create_table :ords do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
