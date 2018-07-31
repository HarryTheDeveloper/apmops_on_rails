class UserInfoController < ApplicationController
  devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!

  def info
    render json: current_member
  end
end
