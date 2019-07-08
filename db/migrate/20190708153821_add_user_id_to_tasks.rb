class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    change_table :tasks do |t|
      t.integer :user_id
    end
  end
end
