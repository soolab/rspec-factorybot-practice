# frozen_string_literal: true
# Todo Factory bot for testing
FactoryBot.define do
  factory :todo do
    # user association test 하기!!
    # 자동으로 연관되도록 만들고 있는 것임
    # 자동으로 :user factory를 가져오는 것인가보다..
    user
    name { 'todo' }
  end
end
