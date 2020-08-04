class AddPriceToServices < ActiveRecord::Migration[6.0]
  def change
    change_column :services, :price, :decimal, precision: 5, scale: 2, using: 'price::decimal(5,2)'
  end
end
