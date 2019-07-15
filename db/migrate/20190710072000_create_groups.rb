class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :groups_users do |t|
      t.references :group
      t.references :user

      t.timestamps
    end
  end
end
