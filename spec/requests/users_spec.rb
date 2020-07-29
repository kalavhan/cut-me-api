require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  let(:user_email) { users.first.email }
  let(:user_pwd) { users.first.password }

  describe 'POST /users/signin' do
    let(:valid_attributes) { { email: user_email, password: user_pwd } }

    context 'when the record exists' do
      before { post "/users/signin", params: valid_attributes }
      it 'returns the user' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { post "/users/signin", params: { email: 'not@mail.com', password: 'notPwd' } }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) { { email: 'kal@kal.com', password: 'a123456', password_confirmation: 'a123456', name: 'kalavhan', last_name: 'Brigido' } }

    context 'when the request is valid' do
      before { post '/users/signup', params: valid_attributes }

      it 'creates a user' do
        expect(JSON.parse(response.body)['name']).to eq('kalavhan')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the email is invalid' do
      before { post '/users/signup', params: { email: 'kal', password: 'a123456', password_confirmation: 'a123456', name: 'kalavhan', last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email is invalid/)
      end
    end

    context 'when the password is invalid' do
      before { post '/users/signup', params: { email: 'kal@kal.com', password: '1', password_confirmation: nil, name: 'kalavhan', last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect((response.body)+" ")
          .to match(/(minimum is 6 characters)/)
      end
    end

    context 'when the name is invalid' do
      before { post '/users/signup', params: { email: 'kal@kal.com', password: 'a123456', password_confirmation: 'a123456', name: nil, last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end

  end
end