class ChangeTaskkindToCategoryid < ActiveRecord::Migration
  def up
  	rename_column :tasks, :kind, :category_id
  end

  def down
  	rename_column :tasks, :category_id, :kind
  end
end
