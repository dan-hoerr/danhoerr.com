class YouCantUseClassAsAColumnDumbass < ActiveRecord::Migration
  def up
  	rename_column :categories, :class, :cssclass
  end

  def down
  	rename_column :categories, :cssclass, :class
  end
end
