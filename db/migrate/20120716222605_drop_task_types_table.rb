class DropTaskTypesTable < ActiveRecord::Migration
  def up
  	drop_table :task_types
  end

  def down
  end
end
