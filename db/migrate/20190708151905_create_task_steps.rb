class CreateTaskSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :task_steps do |t|
      t.integer :task_id
      t.datetime :started
      t.datetime :stopped

      t.timestamps
    end
  end
end
