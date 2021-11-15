# frozen_string_literal: true
# UserTokenSerializer for testing
class UserTokenSerializer < BaseSerializer

  def initialize(model_instance)
    super(model_instance)
  end

  def serialized_hash
    {
      token: m.token
    }
  end

  def serialized_json
    serialized_hash.as_json
  end
end
