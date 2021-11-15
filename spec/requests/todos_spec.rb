# frozen_string_literal: true
# Todos Spec for testing
require 'rails_helper'
RSpec.describe 'TODO API', type: :request do

  describe 'create_test' do

    # 일단 이렇게 관계 맺는 것이 가능하다는 것!!
    # 하나 알게 되었고.
    let!(:user) {
      create(:user) do |user|
        user.todos.create(attributes_for(:todo))
        user.todos.create(attributes_for(:todo))
      end
    }
    context 'test' do
      it 'test' do
        expect(user.todos.length).to be == 2
      end
    end
  end

  describe '관계 실험하기' do

    context '관계 실험하기' do
      let!(:todo) { create :todo }

      it '관계 실험하기' do
        expect(todo.user.present?).to eq(true)
      end
    end
  end

end
