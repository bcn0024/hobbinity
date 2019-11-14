class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.timestamps
      t.references :category, foreign_key: true
    end
  end
end
