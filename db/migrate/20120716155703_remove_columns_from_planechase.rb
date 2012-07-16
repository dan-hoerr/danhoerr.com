class RemoveColumnsFromPlanechase < ActiveRecord::Migration
  def up
    remove_column :planechases, :title
    remove_column :planechases, :effect
    remove_column :planechases, :chaos
    remove_column :planechases, :img
  end

  def down
    add_column :planechases, :img, :string
    add_column :planechases, :chaos, :string
    add_column :planechases, :effect, :string
    add_column :planechases, :title, :string
  end
end
