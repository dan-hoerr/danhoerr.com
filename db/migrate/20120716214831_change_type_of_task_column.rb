class ChangeTypeOfTaskColumn < ActiveRecord::Migration
  def up
  	 change_table :tasks do |t|
  		t.change :kind, :integer
  	end
  end

  def down
  	 change_table :tasks do |t|
  		t.change :kind, :string
  	end
  end
end
