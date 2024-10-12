module Serviceable
    extend ActiveSupport::Concern

    included do
      before_create :create_connection
      after_create :send_to_service
    end

    class_methods do
      private
        def create_connection
          PallyService.new
        end

        def send_to_service
          create_connection.create_task(ServiceTask.to_service_json(self.id))
          Rails.logger.info("Task #{self.id} created")
        end
    end
end
