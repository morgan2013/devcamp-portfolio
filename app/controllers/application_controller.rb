class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource

  def current_user
    super || OpenStruct.new(name: 'Guest',
                            first_name: 'guest',
                            last_name: 'guest',
                            email: 'example.com')
  end
end
