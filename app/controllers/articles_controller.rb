class ArticlesController < ApplicationController
 before_action :set_article, only: [:show, :edit, :update, :destroy]


  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was saved successfully"
      redirect_to article_path(@article)

    else
      render 'new'
    end
  end

  def edit
  end

  def update
    set_article
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

 private

 def set_article
 @article = Article.find(params[:id])
 end

 def article_params
  params.require(:article).permit(:title, :description)
 end

end
