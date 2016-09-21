class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.datetime :date
      t.integer :goal
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
