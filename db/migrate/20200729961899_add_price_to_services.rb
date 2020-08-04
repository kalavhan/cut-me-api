class AddPriceToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :price, :money
  end
end
