class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :status
      t.float :total_payment
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :payment_type

      t.timestamps
    end
  end
end
