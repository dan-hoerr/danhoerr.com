class Task < ActiveRecord::Base
  attr_accessible :content, :kind, :name
  has_many :task_types
end
