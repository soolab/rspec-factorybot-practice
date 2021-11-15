# frozen_string_literal: true

shared_examples 'Unauthorized 응답 처리' do |request_method_name|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before do
      log_out_all
      send request_method_name
    end

    it do
      expect(response).to have_http_status(401)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq('올바르지 않은 인증정보입니다.')
    end
  end
end

shared_examples 'Forbidden 응답 처리' do |request_method_name, message = '접근 권한이 없습니다.'|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(403)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
    end
  end
end

shared_examples 'PassRequired 응답 처리' do |request_method_name, message = '접근 권한이 없습니다.'|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(403)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
      expect(subject['meta']['error_code']).to eq('require_pass')
    end
  end
end

shared_examples 'ExpiredInvitationCode 응답 처리' do |request_method_name, message = '접근 권한이 없습니다.'|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(409)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
      expect(subject['meta']['error_code']).to eq('expired_invitation_code')
    end
  end
end

shared_examples 'UsedInvitationCode 응답 처리' do |request_method_name, message = '접근 권한이 없습니다.'|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(409)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
      expect(subject['meta']['error_code']).to eq('used_invitation_code')
    end
  end
end

shared_examples 'LimitOverInvitation 응답 처리' do |request_method_name, message = '접근 권한이 없습니다.'|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(409)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
      expect(subject['meta']['error_code']).to eq('limit_over_invitation')
    end
  end
end

shared_examples 'Not Found 응답 처리' do |request_method_name|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(404)
      expect(subject['data']).to eq(data || {})
      expect(subject['meta']['message']).to eq(message)
    end
  end
end

shared_examples 'Bad Request 응답 처리' do |request_method_name|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(400)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
    end
  end
end

shared_examples 'Conflict 응답 처리' do |request_method_name|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(409)
      expect(subject['data']).to eq({})
      expect(subject['meta']['message']).to eq(message)
    end
  end
end

shared_examples 'Unprocessable Entity 응답 처리' do |request_method_name|
  describe '응답' do
    subject { JSON.parse(response.body) }

    before { send request_method_name }

    it do
      expect(response).to have_http_status(422)
      expect(subject['data']).to eq(data)
      expect(subject['meta']['message']).to eq(message)
    end
  end
end

shared_examples 'OK 응답 처리' do |request_method_name|
  before { send request_method_name }

  describe '응답' do
    subject { JSON.parse(response.body) }

    it do
      expect(response).to have_http_status(200)
      expect(subject['data']).to eq(data.as_json)
      expect(subject['meta']).to eq(meta.as_json)
    end
  end
end

shared_examples 'Created 응답 처리' do |request_method_name|
  before { send request_method_name }

  describe '응답' do
    subject { JSON.parse(response.body) }

    it do
      expect(response).to have_http_status(201)
      expect(subject['data']).to eq(data.as_json)
      expect(subject['meta']).to eq(meta.as_json)
    end
  end
end
