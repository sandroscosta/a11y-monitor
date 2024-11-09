class LinksController < ApplicationController
  def new
    @project = project_params
  end

  def create
    @link = ServiceTask.new(link_params)
    @link.project_id = project_params.id
    @link.standard = project_params.standard

    if @link.save
      redirect_to project_path(project_params), notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    Project.find(params[:project_id])
  end

  def link_params
    params.require(:service_task).permit(:name, :url)
  end
end
