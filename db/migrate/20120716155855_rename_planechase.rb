class RenamePlanechase < ActiveRecord::Migration
  def up
  	rename_table :planechases, :planes
  end

  def down
  	rename_table :planes, :planechases
  end
end
