# frozen_string_literal: true
# TodosControllerSpec for testing
require 'rails_helper'
require 'auth_helper'
require 'shared_helper'
# TodosControllerSpec for testing
RSpec.describe TodosController, type: :controller do
  include AuthHelper

  def request
    post :create, params: params
  end

  describe '올바른 요청일 경우' do
    let!(:user) { create :user }
    let(:params) do
      {
        name: 'todo'
      }
    end

    before { log_in_user user }

    it_behaves_like 'Created 응답 처리', :request do
      let(:data) do
        {
          id: 1,
          name: 'todo',
          user_id: user.id
        }
      end
      let(:meta) { { } }
    end
  end
end