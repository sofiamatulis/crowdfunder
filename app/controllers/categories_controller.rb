class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @projects = @category.projects
    @users    = User.all
    respond_to do |format|
      format.html
      #format.json { render json: @rest_hash_arr} # @restaurants}
      format.json { render json: {projects: @projects, users: @users,category: @category}}
    end
  end
end
