class Api::V1::BaseController < ActionController::Base
  include Response
  include ExceptionHandler
  before_action :authenticate!

  private

  def authenticate!
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ProxyCrawl' && password == 'proxxxy'
    end unless Rails.env.test?
  end

end