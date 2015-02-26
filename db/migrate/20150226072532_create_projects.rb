class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.timestamps null: false
      t.string :name
    end
    add_index :projects, :name
  end
end
