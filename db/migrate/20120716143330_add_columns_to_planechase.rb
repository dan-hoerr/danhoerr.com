class AddColumnsToPlanechase < ActiveRecord::Migration
  def change
    add_column :planechases, :title, :string
    add_column :planechases, :effect, :string
    add_column :planechases, :chaos, :string
    add_column :planechases, :img, :string
  end
end
