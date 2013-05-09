class Work < ActiveRecord::Base
  attr_accessible :charge, :client, :description, :name, :private_work, :url, :year
end
