class AddCorrectColumnsToPlanechase < ActiveRecord::Migration
  def change
    add_column :planechases, :title, :string
    add_column :planechases, :text, :string
    add_column :planechases, :img, :string
    add_column :planechases, :type, :string
    add_column :planechases, :multiverseid, :string
  end
end
