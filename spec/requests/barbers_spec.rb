require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data 
  let!(:barber) { create(:barber) }
  let(:barber_id) { barber.id }
  let(:services) { create_list(:service, 2, barber: barber) }
  let(:service) { services.first }
  # get '/barbers/index', to: 'barbers#index'
  # get '/barbers/show/:id', to: 'barbers#show'

  # Test suite for GET /barbers/index
  describe 'GET /barbers/index' do
    context 'when the record exists' do
      before { get "/barbers/index" }
      it 'returns all the barbers' do
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