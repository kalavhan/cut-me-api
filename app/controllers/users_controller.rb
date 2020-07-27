class UsersController < ApplicationController
  def signin
    @user = User.find_by!(email: params["email"]).try(:authenticate, params["password"]);
    user_data = {"id" => @user.id, "token" => @user.token}
    json_response(user_data)
  end

  def signup
    @user = User.create!(user_params)
    user_data = {"id" => @user.id, "token" => @user.token, "name" => @user.name}
    json_response(user_data, :created)
  end

  private

  def user_params
    # whitelist params
    params.permit(:email, :password, :password_confirmation, :name, :last_name)
  end

end
