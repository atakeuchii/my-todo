class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :status, null: false, default: "todo"
      t.integer :priority, null: false, default: 0
      t.datetime :deadline
      t.string :tags, array: true, null: false, default: []
      t.bigint :parent_id
      t.bigint :user_id

      t.timestamps
    end

    add_index :tasks, :parent_id
    add_index :tasks, :user_id
  end
end
