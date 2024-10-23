module Serviceable
    extend ActiveSupport::Concern

    included do
      before_create :create_connection
      after_create :send_to_service

      def create_connection
        PallyService.instance
      end

      def send_to_service
        response = create_connection.create_task(ServiceTask.to_service_json(self.id))
        if response
          Rails.logger.info("Task #{self.id} created")
          self.update(service_id: response["id"])
        end
      end

      def run_task
        response = create_connection.run_task(self.service_id)
      end
    end
end
