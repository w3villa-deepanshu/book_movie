class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.date :show_date
      t.time :start_time
      t.time :end_time
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
