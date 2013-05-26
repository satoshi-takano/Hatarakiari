ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def login(user)
    old_controller = @controller
    @controller = SessionsController.new

    auth = { :provider=>"github", :uid=>user.uid, :info=>{ :nickname=>"test", :image=>"https://si0.twimg.com/profile_images/1736689431/nuko.png" } }
    @request.env["omniauth.auth"] = auth;
    @request.session["user_id"] = users(:one).id
    get :callback, { :provider=>"github"}
    
    @controller = old_controller
  end
end
