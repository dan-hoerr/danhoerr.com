class AddPublicToPortolio < ActiveRecord::Migration
  def change
  	add_column :portfolios, :public, :boolean
  end
end
