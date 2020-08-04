require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should validate_presence_of(:appt_date) }
  it { should allow_value('July 28, 2018 18:36:00').for(:appt_date) }
  it { should_not allow_value('three days from today').for(:appt_date) }

  it { should validate_presence_of(:barber_id) }

  it { should validate_presence_of(:user_id) }

  it { should belong_to(:user) }

  it { should belong_to(:barber) }
end
