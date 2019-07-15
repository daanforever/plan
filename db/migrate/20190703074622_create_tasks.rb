class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :user
      t.integer :assignee_id
      t.string :assignee_type

      t.timestamps
    end
  end
end
