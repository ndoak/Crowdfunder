class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def show
    @user = User.find(params[:id])
    @owned_projects = @user.owned_projects

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(:projects)
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
