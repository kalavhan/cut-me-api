class UsersController < ApplicationController
  def signin
    @user = User.find_by!(email: params["email"]).try(:authenticate, params["password"]);
    json_response(@user)
  end

  def signup
    @user = User.create!(user_params)
    json_response({@user.id, @user.token}, :created)
  end

  private

  def user_params
    # whitelist params
    params.permit(:email, :password, :password_confirmation, :name, :last_name)
  end

end
