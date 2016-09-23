class ProjectsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_cat


  def index
    @projects = Project.all
    @categories = Category.all
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    else
      @projects = Project.all.order('created_at DESC')
    end
  end

  def show
    @pledge = Pledge.new
    @project = Project.find(params[:id])
    @count = Pledge.count(@project)
    @rewards = Reward.find_rewards(@project.id)
    if Project.reached_goal?(@project) == false
      Pledge.destroy_pledges(@project)
    end

  end

  def new
    @project = Project.new
    @project.rewards.build
    @reward = Reward.new
  end

  def edit
  end

  def create
    @project = @user.owned_projects.new(project_params)

    if @project.save!
      flash[:sucess] = 'New Project succesfully added to Crowfunder'
      redirect_to project_url(@project)
    else
      render :new
    end
  end

  def update

    @project.update_attributes(project_params)
    if @project.save
      flash[:sucess] = 'Project successfully Updated'
      redirect_to project_url(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project is destroyed"
    redirect_to projects_url
  end


  private

    def set_user
      @user =  current_user
    end
    def set_project
      @project = Project.find(params[:id])
    end
    def set_cat
      @categories = Category.all
    end

    def project_params
      params.require(:project).permit(:name, :date, :goal, :user_id, :category_id, :description, rewards_attributes:[:amount, :description, :_destroy])
    end
end
