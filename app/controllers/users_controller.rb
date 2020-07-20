class UsersController < ApplicationController
  def signin
    @user = User.find_by(email: params["email"])
    if @user&.authenticate(params["password"])
      json_response(@user)
    else
      json_response('nono');
    end
  end

  def signup
  end
end
