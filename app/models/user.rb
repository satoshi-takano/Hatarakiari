class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :avatar_url

  validates_presence_of :name, :provider, :uid, :avatar_url

  has_many :works, :dependent=>:delete_all
  has_many :guests, :dependent=>:delete_all

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.avatar_url = auth["info"]["image"]
    end
  end
end

