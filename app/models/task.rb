class Task < ActiveRecord::Base
  attr_accessible :content, :category_id, :name
  belongs_to :category
end
