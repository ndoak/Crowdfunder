class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project Saved!"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


private
  def project_params
    params.require(:project)
          .permit(:title, :description, :funding_goal, :start_date, :end_date)
          # rewards_attributes[:title,:description,:amount])
  end
end
