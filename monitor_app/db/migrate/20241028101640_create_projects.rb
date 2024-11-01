class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.datetime :seal_date
      t.integer :seal_level, default: 0
      t.boolean :is_active, default: true
      t.string :standard, default: "WCAG2AA"

      t.index :name, unique: true
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
