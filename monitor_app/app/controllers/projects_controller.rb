class ProjectsController < ApplicationController
  def show; end
  
  def new
    @project = Project.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :standard, :screenshot)
  end
end
