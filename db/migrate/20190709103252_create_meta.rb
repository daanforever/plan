class CreateMeta < ActiveRecord::Migration[5.2]
  def change
    create_table :meta do |t|
      t.references :user, foreign_key: true
      t.references :task, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
