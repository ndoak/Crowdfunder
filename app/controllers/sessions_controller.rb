class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:projects)
    else
      flash.now[:alert] = 'Login Failed, Invalid email or password'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(new_session_path)
  end
end
