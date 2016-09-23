class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    @user = current_user
    @user_pledges = @user.pledges
    @user_projects = @user.owned_projects
    projects = Project.all
    @rewards = []
    @rewards_hash = Project.user_rewards(@user, projects)
    @rewards_hash.each do |key,value|
      if key == @user.id
        @rewards << value
      end
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to projects_path
    else 
      render 'new'
    end
  end

    private 

    def user_params 
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
