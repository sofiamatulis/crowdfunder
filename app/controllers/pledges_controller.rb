class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.project = Project.find(params[:id])
    if @pledge.save
      redirect_to project_path(@pledge.project), :notice => 'it worked'
    else
      render :new
    end
  end

  private

  def pledge_params
    params.require(:pledges).permit(:project_id, :user_id, :amount)
  end
end
