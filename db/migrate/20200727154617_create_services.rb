class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :barber_id
      t.decimal :price, precision: 5, scale:2
      t.timestamps
    end
  end
end
