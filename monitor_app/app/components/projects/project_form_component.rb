# frozen_string_literal: true

class Projects::ProjectFormComponent < ViewComponent::Base
  def initialize(project)
    @project = project
  end
end
