require 'net/http'
require 'uri'
require 'openssl'
require 'json'

class ApiService
  include ApiErrors

  def self.get_fonts(params={})
    begin
      params[:key] = ENV['WEBFONTS_API_KEY']
      response = self.make_request(params.to_query)
      if response.code != '200'
        error_message = JSON.parse(response.body)['error']['message']
        status_message = JSON.parse(response.body)['error']['status']
        raise ExternalApiError.new(status_message, error_message, response.code)
      end
      JSON.parse(response.body)
    rescue StandardError => e
      raise e
    end
  end

  private

  def self.make_request(params)
    url = URI.parse("https://www.googleapis.com/webfonts/v1/webfonts?#{params}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    http.request(request)
  end
end
