require 'api_service'
class WebfontsController < ApplicationController
  def index
    begin
      @fonts = ApiService.get_fonts(allowed_params)
      # Do something with @fonts data

      render json: @fonts
    rescue ApiErrors::ExternalApiError => e
      render json: { error: e.to_s }, status: e.code
    end
  end
  
  private
  def allowed_params
    params.permit(:subset, :family, :sort)
  end
end
