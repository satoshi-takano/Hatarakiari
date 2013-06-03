require 'spec_helper'

describe User do
  describe "User#create_with_omniauth" do

    it "creates a new user" do
      auth = {
        "provider" => "github",
        "uid" => "123456",
        "info" => {
          "nickname" => "test_user",
          "image" => "http://test.harataki.in"
        }
      }
      user = User.create_with_omniauth(auth)
      @user = User.where("name = ?", "test_user").first
      @user.should_not be_nil
    end
  end
end
