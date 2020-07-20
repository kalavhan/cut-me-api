require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # initialize test data 
  let!(:users) { create_list(:user, 10) }
  let(:user_email) { users.first.email }
  let(:user_pwd) { users.first.password_digest }

  # Test suite for GET /todos/:email
  describe 'GET /users/:email/:pwd' do
    before { get "/todos/#{user_email}/#{user_pwd}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['email']).to eq(user_email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /users' do
    # valid payload
    let(:valid_attributes) { { email: 'kal@kal.com', password_digest: 'a123456', first_name: 'kalavhan', middle_name: 'Josue', last_name: 'Brigido' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a todo' do
        expect(json['email']).to eq('kal@kal')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the email is invalid' do
      before { post '/todos', params: { email: 'kal', password_digest: 'a123456', first_name: 'kalavhan', middle_name: 'Josue', last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Please enter a valid email/)
      end
    end

    context 'when the password is invalid' do
      before { post '/todos', params: { email: 'kal', password_digest: nil, first_name: 'kalavhan', middle_name: 'Josue', last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Please enter a valid password/)
      end
    end

    context 'when the name is invalid' do
      before { post '/todos', params: { email: 'kal', password_digest: 'a123456', first_name: nil, middle_name: 'Josue', last_name: 'Brigido' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Please enter a valid name/)
      end
    end

  end
end