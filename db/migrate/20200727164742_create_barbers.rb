class CreateBarbers < ActiveRecord::Migration[6.0]
  def change
    create_table :barbers do |t|
      t.string :name
      t.string :last_name
      t.string :role
      t.string :image

      t.timestamps
    end
  end
end
