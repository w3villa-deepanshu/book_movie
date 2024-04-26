class AddPriceToShow < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :price_per_ticket, :float
  end
end
