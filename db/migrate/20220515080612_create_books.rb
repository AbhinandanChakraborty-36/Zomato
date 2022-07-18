class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.integer :head
      t.date :booked_on
      t.time :booked_at

      t.timestamps
    end
  end
end
