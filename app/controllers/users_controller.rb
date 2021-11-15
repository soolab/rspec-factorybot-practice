# frozen_string_literal: true
# UsersController for testing
require 'securerandom'
# UserController for testing
class UsersController < ApplicationController

  skip_before_action :authenticate_user
  skip_before_action :require_authorize

  BASE_64_KEY = 100

  def signup
    @user = User.create!(signup_params)
    json_create_success(UserSerializer.new(@user).serialized_hash)
  end

  def signin
    @user = User.find_by(name: params[:name])
    raise Exceptions::Unauthorized, '올바르지 않는 인증정보입니다.' unless @user.present?
    raise Exceptions::Unauthorized, '올바르지 않는 인증정보입니다.' unless @user.authenticate(params[:password])

    token = SecureRandom.base64(BASE_64_KEY)
    @user_token = UserToken.create!(user: @user, token: token)
    json_success(UserTokenSerializer.new(@user_token).serialized_hash)
  end

  def signup_params
    params.require(:name)
    params.require(:password)

    params.permit(:name, :password)
  end

  def signin_params
    params.require(:name)
    params.require(:password)

    params.permit(:name, :password)
  end
end
