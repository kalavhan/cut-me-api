class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :appt_date
      t.integer :barber_id
      t.integer :user_id

      t.timestamps
    end
  end
end
