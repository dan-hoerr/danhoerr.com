class Portfolio < ActiveRecord::Base
  attr_accessible :project_name, :tasks, :thumbnail
end
