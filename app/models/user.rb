class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :works, :dependent=>:delete_all
  has_many :guests, :dependent=>:delete_all

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end
end

