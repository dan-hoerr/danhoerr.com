class CreatePlanechases < ActiveRecord::Migration
  def change
    create_table :planechases do |t|

      t.timestamps
    end
  end
end
