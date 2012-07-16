class Portfolio < ActiveRecord::Base
  attr_accessible :project_name, :tasks, :image, :image_cache, :link

  mount_uploader :image, PortfolioUploader
end
