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
    @project.owner = current_user

    authorize! :manage, @project
    if @project.save
      redirect_to category_path(@project.category), notice: "Project Saved!"
    else
      flash[:notice] = "Did you fill out EVERYTHING?"
      render :new
    end


  end

  def show
    @project = Project.find(params[:id])
    @user_project = User.find(@project.user_id)
    @user = current_user
    @project.project_expire()
    @project.money_raised()
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def donate
    @reward.user_id = current_user
    @project = Project.find(params[:id])
    @reward = Reward.find(params[:reward_id])
    @project.update_funding_goal(@project.funding_goal, @reward.amount)
    render partial: "funding_goal"
  end


private
  def project_params
    params.require(:project)
          .permit(:title, :description, :funding_goal, :start_date, :end_date, :category_id,
          rewards_attributes:[ :title, :description, :amount, :_destroy])
  end
end
