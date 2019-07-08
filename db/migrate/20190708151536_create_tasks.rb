class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :description
      t.integer :customer_id
      t.integer :project_id

      t.timestamps
    end
  end
end
