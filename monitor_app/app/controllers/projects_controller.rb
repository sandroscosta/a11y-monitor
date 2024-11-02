class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.valid?
      @project.save
      redirect_to root_path, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @project = Project.find(params[:slug])
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
