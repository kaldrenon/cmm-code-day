class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :numfield
      t.text :textfield
      t.string :title

      t.timestamps
    end
  end
end
