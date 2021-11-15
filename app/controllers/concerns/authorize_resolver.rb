# frozen_string_literal: true
# AuthorizeResolver for testing
module AuthorizeResolver
  extend ActiveSupport::Concern
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  included do
    # career-api에 있는대로 prepend_before_action 하니까 안됨.
    # 이거 나중에 물어보도록 하자.
    before_action :authenticate_user
    before_action :require_authorize
  end

  attr_accessor :current_user_token, :current_user

  private

  def authenticate_user
    @current_user_token ||= authenticate_with_http_token { |token, _options| token }
    @current_user = find_user_via_db(@current_user_token)
  end

  def current_user_id
    # 이거 안되면은 current_user로 바꾸어보자.
    # 내가 임의로 인스턴스 변수를 쓴거임.
    @current_user.present? ? @current_user.id.to_s : 'Anonymous'
  end

  def current_user_name
    @current_user.present? ? @current_user.name : 'Anonymous'
  end

  def find_user_via_db(token)
    raise Exceptions::Unauthorized, '로그인이 필요합니다.' unless UserToken.exists?(token: token)

    UserToken.find_by(token: token).user
  end

  def require_authorize
    return if current_user # || current_recruiter

    raise Exceptions::Unauthorized, '로그인이 필요합니다.'
  end
end
