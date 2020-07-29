class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :appt_date
      t.time :appt_time
      t.integer :barber_id
      t.integer :user_id

      t.timestamps
    end
  end
end
