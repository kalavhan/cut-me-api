require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  let!(:barber) { create(:barber) }
  let!(:user) { create(:user) }
  let(:b_id) { barber.id }
  let(:u_id) { user.id }
  let!(:appointments) { create_list(:appointment, 2, barber: barber, user: user) }
  let(:appointment) { appointments.first }

  describe 'POST /appointments/add' do
    context 'Add a new record to appointments table' do
      before { post '/appointments/add', params: { appt_date: '2018/07/20', appt_time: '13:15', barber_id: b_id, user_id: u_id } }
      it 'returns the appointment' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)[0]["id"]).to eq(barber_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
  describe 'GET /barbers/show/:id' do
    context 'when the record exists' do
      before { get "/barbers/show/#{barber_id}" }
      it 'returns the existing barber' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)["id"]).to eq(barber_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      before { get "/barbers/show/23" }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Barber/)
      end
    end
  end
end