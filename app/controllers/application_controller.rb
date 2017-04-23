class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource

  before_action :set_title_default

  def current_user
    super || guest_user
  end

  def guest_user
    GuestUser.new(name: 'Guest',
                  first_name: 'guest',
                  last_name: 'guest',
                  email: 'example.com')
  end

  def set_title_default
    @page_title = 'Devcamp Portfolio | My Portfolio Website'
    @seo_keywords = 'Jordan Hudgens portfolio'
  end
end
