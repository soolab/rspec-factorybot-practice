# frozen_string_literal: true
# TodoSerializer for testing
class TodoSerializer < BaseSerializer
  def serialized_hash
    {
      id: m.id,
      name: m.name,
      user_id: m.user.id
    }
  end
end

