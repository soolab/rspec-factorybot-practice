# frozen_string_literal: true
# User Factory for testing
FactoryBot.define do
  factory :user do
    name { 'hello' }
    password { 'hello' }
  end
end
