class Work < ActiveRecord::Base
  has_many :guests, :dependent=> :delete_all
  attr_accessible :client, :description, :name, :private_work, :role, :url, :year

  validates_presence_of :name, :year
  validates_numericality_of :year
end
