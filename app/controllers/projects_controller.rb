class ProjectsController < ApplicationController
  # load_and_authorize_resource


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    authorize! :manage, @project
  end

  def create
    @project = Project.new(project_params)
    authorize! :manage, @project

    if @project.save
      redirect_to projects_path, notice: "Project Saved!"
    else
      render :new
    end


  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def donate
    @project = Project.find(params[:id])
    reward = Reward.find(params[:reward_id])
    @project.update_funding_goal(@project.funding_goal, reward.amount)
    render partial: "funding_goal"
  end


private
  def project_params
    params.require(:project)
          .permit(:title, :description, :funding_goal, :start_date, :end_date, 
          rewards_attributes:[ :title, :description, :amount, :_destroy])
  end
end
