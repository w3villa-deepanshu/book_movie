class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.string :seat_no
      t.boolean :booked
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
