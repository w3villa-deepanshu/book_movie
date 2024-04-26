class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.string :seat_ids, array: true, default: []
      t.float :total_price
      t.integer :status
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
