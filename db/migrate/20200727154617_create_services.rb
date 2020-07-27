class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services do |t|
      t.string :title
      t.integer :barber_id

      t.timestamps
    end
  end
end
