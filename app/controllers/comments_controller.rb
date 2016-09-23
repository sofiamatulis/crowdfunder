class CommentsController < ApplicationController
  before_action :ensure_logged_in

  def new
    @project = Project.find(params[:project_id])
    @comment = Comment.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @comment = @project.comments.create(comment_params)
    @comment.user = @user

    if @comment.save
      redirect_to project_path(@project)
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:head,:body)
  end
end
