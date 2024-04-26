class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.string :language
      t.text :desc

      t.timestamps
    end
  end
end
