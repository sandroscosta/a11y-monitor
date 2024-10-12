class CreateServiceTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :service_tasks do |t|
      t.string :name
      t.string :url
      t.string :standard, default: "WCAG2AA"
      t.string :options
      t.string :service_id

      t.timestamps

      t.index :service_id
      t.index :name
    end
  end
end
