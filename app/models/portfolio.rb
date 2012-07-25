class Portfolio < ActiveRecord::Base
  attr_accessible :project_name, :tasks, :image, :image_cache, :link, :public

  mount_uploader :image, PortfolioUploader

  validates :project_name, :presence => true
  validates :tasks, :presence => true
  validates :image, :presence => true
  validates :link, :presence => true
end
