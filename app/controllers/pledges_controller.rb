class PledgesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @pledge = Pledge.new
  end

  def create
    @user = current_user
    @project = Project.find(params[:project_id])
    @pledge = @project.pledges.new(pledge_params)
    @pledge.user = @user
    if @pledge.save
      redirect_to project_path(@project), :notice => "#{@pledge.amount} was successfully submitted to #{@project.name}"
    else
      render :new
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:project_id, :user_id, :amount)
  end
end
