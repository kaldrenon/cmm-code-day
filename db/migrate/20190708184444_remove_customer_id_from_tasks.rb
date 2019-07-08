class RemoveCustomerIdFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :customer_id
  end
end
