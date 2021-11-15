# frozen_string_literal: true
# users spec for testing
require 'rails_helper'
RSpec.describe 'USER API TEST', type: :request do

  describe 'POST /users/sign-up' do
    context '유효한 입력이 들어오면' do
      before { post '/users/sign-up', params: { name: 'jinsoo', password: 'jinsoo' } }

      it 'HTTP STATUS 201 과 유저정보를 리턴한다.' do
        body = JSON.parse(response.body)
        data = body['data']

        expect(response).to have_http_status(201)
        expect(data['id']).to be
        expect(data['name']).to be
      end
    end

    # describe end
  end

  describe 'POST /users/sign-in' do
    context '유효한 입력이 들어오면' do
      let!(:user) { create :user }

      before { post '/users/sign-in', params: { name: 'hello', password: 'hello' } }
      it 'HTTP STATUS 200과 token 값을 반환한다. ' do
        body = JSON.parse(response.body)
        data = body['data']

        expect(response).to have_http_status(200)
        expect(data['token']).to be
      end
    end
  end

  describe '어트리뷰트 바꾸기 실험' do

    context '어트리뷰트 바꾸기 실험' do
      # let은 아무렇게나 지어도 된다. 어트리뷰트 바꾸는 것도 성공했다.
      # 그렇다면 let! 이 중요하다. let은 안되고 let!은 된다.
      # 무슨 차이일까..
      let!(:jinsoo) { create(:user, name: 'jinsoo', password: 'jinsoo') }

      before { post '/users/sign-in', params: { name: 'jinsoo', password: 'jinsoo'} }
      it '로그인 성공해야한다' do
        body = JSON.parse(response.body)
        data = body['data']

        expect(response).to have_http_status(200)
        expect(data['token']).to be
      end
    end
  end

  describe 'Trait 실험하기' do

    context 'Trait 실험하기' do

    end
  end
end
