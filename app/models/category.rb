class Category < ActiveRecord::Base
  attr_accessible :cssclass, :name

  has_many :tasks
end
