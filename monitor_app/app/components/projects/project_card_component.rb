# frozen_string_literal: true

class Projects::ProjectCardComponent < ViewComponent::Base
  with_collection_parameter :project

  def initialize(project:)
    @project = project
  end
end
