class Guest < ActiveRecord::Base
  belongs_to :user
  attr_accessible :login_id, :login_password, :user_id
  validates_presence_of :login_id, :login_password, :user_id
  validates_numericality_of :user_id
end
