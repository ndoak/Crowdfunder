class PledgesController < ApplicationController
  def index
  end

  def new
    @pledge = Pledges.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @reward = Reward.find(params[:reward_id])
    @project = @reward.project
    @pledge.user = current_user
    @pledge.reward = @reward

    if @pledge.save
      @project.update_funding_goal(@reward.amount)

    else
      render :new
  end


  end

  private

  def pledge_params
    params.require(:pledge).permit(:amount)
  end

end
