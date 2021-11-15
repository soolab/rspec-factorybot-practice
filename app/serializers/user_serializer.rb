# frozen_string_literal: true
# UserSerializer for testing
class UserSerializer < BaseSerializer

  def initialize(model_instance)
    super(model_instance)
  end

  def serialized_hash
    {
      id: m.id,
      name: m.name
    }
  end
end
