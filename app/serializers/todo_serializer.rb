# frozen_string_literal: true
# TodoSerializer for testing
class TodoSerializer < BaseSerializer

  def initialize(model_instance)
    super(model_instance)
  end

  def serialized_hash
    {
      id: m.id,
      name: m.name,
      user_id: m.user ? m.user.id : nil
    }
  end
end

