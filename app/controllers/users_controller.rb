# frozen_string_literal: true
# UsersController for testing
class UsersController < ApplicationController

  def signup

    @user = User.create!(signup_params)
    json_create_success(UserSerializer.new(@user).serialized_hash)
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
