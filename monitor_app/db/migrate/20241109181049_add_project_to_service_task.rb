class AddProjectToServiceTask < ActiveRecord::Migration[8.1]
  def change
    add_reference :service_tasks, :project, null: false, foreign_key: true
  end
end
