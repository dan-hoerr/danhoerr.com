class RemoveColumnsFromPortfolios < ActiveRecord::Migration
  def up
    remove_column :portfolios, :photo_file_name
    remove_column :portfolios, :photo_content_type
    remove_column :portfolios, :photo_file_size
  end

  def down
    add_column :portfolios, :photo_file_size, :string
    add_column :portfolios, :photo_content_type, :string
    add_column :portfolios, :photo_file_name, :string
  end
end
