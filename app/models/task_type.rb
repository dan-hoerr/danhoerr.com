class TaskType < ActiveRecord::Base
  attr_accessible :name, :typeclass
  belongs_to :task
end
