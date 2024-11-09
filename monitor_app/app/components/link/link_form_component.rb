# frozen_string_literal: true

class Link::LinkFormComponent < ViewComponent::Base
  def initialize(project)
    @link = ServiceTask.new
    @project = project
  end
end
