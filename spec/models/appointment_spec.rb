require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:barber) }
  it { should validate_presence_of(:appt_date) }
  it { should validate_presence_of(:appt_time) }
  it { should validate_presence_of(:barber_id) }
  it { should validate_presence_of(:user_id) }
end
