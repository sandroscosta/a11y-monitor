class ProcessServiceTaskJob < ApplicationJob
  queue_as :default

  def perform(service_task)
    result = service_task.run_task
    Rails.logger.info("Task #{service_task.name} - #{service_task.service_id} processed") if result
  end
end
