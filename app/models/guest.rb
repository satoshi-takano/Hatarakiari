# coding: utf-8
class Guest < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :login_id, :login_password, :user_id, :memo
  validates_presence_of :login_id, :login_password, :user_id, :message=>"は入力が必須です"
  validates_format_of :login_id, :with=> /^[0-9A-Za-z]/, :message=>"は半角英数字で入力してください"
  validates_format_of :login_password, :with=> /^[0-9A-Za-z]/, :message=>"は半角英数字で入力してください"
  
  validates_numericality_of :user_id
  validates_length_of :login_id, :in => 1..32, :message=>"は32字以下で入力してください"
  validates_length_of :login_password, :in => 6..32, :message=>"は6〜32字で入力してください"
  validates :memo, :length => { :maximum => 140}
  
end
