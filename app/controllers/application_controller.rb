class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :expire_hsts

  layout :layout_by_resource

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def layout_by_resource
    if devise_controller?
      "static"
    else
      "application"
    end
  end

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
