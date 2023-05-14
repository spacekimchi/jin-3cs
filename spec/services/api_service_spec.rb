require 'rails_helper'
require 'webmock/rspec'

RSpec.describe ApiService do
  describe '#get_fonts' do
    it 'raises errors for non-200 API responses' do
      response_factory = build(:missing_api_key)

      response_double = instance_double(Net::HTTPResponse, code: response_factory.code, body: response_factory.body)
      allow(response_double).to receive(:body).and_return(JSON.parse(response_factory.body))
      allow(ApiService).to receive(:make_request).and_return(response_factory)

      expect { ApiService.get_fonts }.to raise_error(ApiErrors::ExternalApiError) do |error|
        expect(error.message).to eq('The request is missing a valid API key.')
      end
    end

    it 'does not raise error for 200 API response' do
      response_factory = build(:get_fonts)

      response_double = instance_double(Net::HTTPResponse, code: response_factory.code, body: response_factory.body)
      allow(response_double).to receive(:body).and_return(JSON.parse(response_factory.body))
      allow(ApiService).to receive(:make_request).and_return(response_factory)

      expect { ApiService.get_fonts }.not_to raise_error
    end

    it 'returns correct fonts on success' do
      response_factory = build(:get_fonts)

      response_double = instance_double(Net::HTTPResponse, code: response_factory.code, body: response_factory.body)
      allow(response_double).to receive(:body).and_return(JSON.parse(response_factory.body))
      allow(ApiService).to receive(:make_request).and_return(response_factory)

      fonts = ApiService.get_fonts

      expect(fonts).to eq(JSON.parse(response_factory.body))
    end
  end
end
