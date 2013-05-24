class Guest < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :login_id, :login_password, :user_id, :memo
  validates_presence_of :login_id, :login_password, :user_id
  validates_numericality_of :user_id
  validates_length_of :login_id, :in => 1..32
  validates_length_of :login_password, :in => 6..32
  validates :memo, :length => { :maximum => 140}
end
