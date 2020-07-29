class Appointment < ApplicationRecord
  validates :appt_date, presence: true
  validates :appt_time, presence: true
  validates :user_id, presence: true
  validates :barber_id, presence: true
  belongs_to :user
  belongs_to :barber
end
