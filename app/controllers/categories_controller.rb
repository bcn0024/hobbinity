class CategoriesController < ApplicationController

  def index
    @categories = Category.all.page(params[:page]).per(4)
  end

  def show
    @category = Category.find(params[:id])
    @groups = @category.groups
  end

end
