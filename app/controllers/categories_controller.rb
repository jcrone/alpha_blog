class CategoriesController < ApplicationController
before_action :require_admin, except: [:index, :show]

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 4)
  end

  def new
    @category = Category.new
  end

  def index
    @category = Category.paginate(page: params[:page], per_page: 4)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was updated"
      redirect_to @category
    else
      render "edit"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only Admin can add categories"
      redirect_to categories_path
    end
  end


end
