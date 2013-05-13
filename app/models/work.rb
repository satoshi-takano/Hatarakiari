class Work < ActiveRecord::Base
  attr_accessible :client, :description, :name, :private_work, :role, :url, :year

  validates_presence_of :name, :year
  validates_numericality_of :year
end
