class AddTypeclassToTaskTypes < ActiveRecord::Migration
  def change
    add_column :task_types, :typeclass, :string
  end
end
