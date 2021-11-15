# frozen_string_literal: true
# AuthHelper for testing

require 'securerandom'

module AuthHelper
  attr_accessor :current_user

  def log_in_user(user)
    token = SecureRandom.base64(100)
    @controller.current_user_token = token
    UserToken.create!(user: user, token: token)
  end

  # def log_in_user
  #   token
  # end

  def log_out_all
    @controller.current_user_token = nil
  end
end