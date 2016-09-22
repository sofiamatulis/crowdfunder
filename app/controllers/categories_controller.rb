class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @projects = @category.projects
    respond_to do |format|
      format.html
      #format.json { render json: @rest_hash_arr} # @restaurants}
      format.json { render json: @projects} 
    end
  end
end
