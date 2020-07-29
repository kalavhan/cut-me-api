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
      before { post '/appointments/add', params: { appt_date: 'July 28, 2018 18:36:00', barber_id: b_id, user_id: u_id } }
      it 'returns the appointment' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)["user_id"]).to eq(u_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'GET /appointments/show/:id' do
    context 'when the record exists' do
      before { get "/appointments/show/#{u_id}" }
      it 'returns the existing appointment' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)).to eq('')
        expect(JSON.parse(response.body)["barber_id"]).to eq(b_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      before { get "/appointments/show/23" }
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Appointment/)
      end
    end
  end
end