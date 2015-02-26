class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.timestamps null: false
      t.text :name, limit: 1000
      t.integer :priority
      t.datetime :deadline
      t.boolean :done
      t.references :project
    end
    add_index :tasks, :name
  end
end
