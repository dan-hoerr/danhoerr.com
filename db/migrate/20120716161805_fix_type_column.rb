class FixTypeColumn < ActiveRecord::Migration
  def up
  	rename_column :planes, :type, :cardtype
  end

  def down
  	rename_column :planes, :cardtype, :type
  end
end
