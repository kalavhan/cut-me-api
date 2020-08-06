class UsersController < ApplicationController
  def signin
    @user = User.find_by!(email: params['email']).try(:authenticate, params['password'])
    json_response(@user, nil, %i[id token])
  end

  def signup
    @user = User.create!(user_params)
    user_data = { 'id' => @user.id, 'token' => @user.token, 'name' => @user.name }
    json_response(user_data, nil, nil, :created)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name, :last_name)
  end
end
