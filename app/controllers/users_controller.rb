class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def show
    @user = User.find(params[:id])


    @project = Project.find(params[:id]).where(@user.id == @project.user_id)


    # start_day = user_time.start_date
    # last_day = user_time.end_date
    # remaining_time = last_day - start_day
    # user_time.time_left(start_date,end_date)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(:users, notice: 'User was sucessfully created')
    else
      render "new"
    end

  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, roles:[])
  end

end
