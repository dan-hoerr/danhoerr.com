class ChangeTypeForText < ActiveRecord::Migration
  def up
  	change_table :planes do |t|
  		t.change :text, :text
  	end
  end

  def down
  	  change_table :planes do |t|
  		t.change :text, :string
  	end
  end
end
