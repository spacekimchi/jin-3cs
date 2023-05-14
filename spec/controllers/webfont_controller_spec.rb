require 'rails_helper'
require 'webmock/rspec'

RSpec.describe WebfontsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      response_factory = build(:get_fonts)
      response_factory_json = JSON.parse(response_factory.body)
      response_double = instance_double(Net::HTTPResponse, code: response_factory.code, body: response_factory.body)
      allow(response_double).to receive(:body).and_return(response_factory_json)
      allow(ApiService).to receive(:make_request).and_return(response_factory)

      get :index

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["items"]).to eq(response_factory_json["items"])
    end

    it 'returns error status when api returns errors' do
      response_factory = build(:invalid_api_key)
      response_factory_json = JSON.parse(response_factory.body)
      response_double = instance_double(Net::HTTPResponse, code: response_factory.code, body: response_factory.body)
      allow(response_double).to receive(:body).and_return(response_factory_json)
      allow(ApiService).to receive(:make_request).and_return(response_factory)

      get :index

      expect(response).to have_http_status(response_factory.code)
      expect(JSON.parse(response.body)["error"]).to include(response_factory_json["error"]["message"])
    end
  end
end
