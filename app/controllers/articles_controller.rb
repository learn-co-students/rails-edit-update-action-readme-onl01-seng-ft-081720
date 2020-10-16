class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # binding.pry
    @article = Article.new
  end

  def create
    # binding.pry # why does this not need to be a nested hash
    @article = Article.new(title: params[:title], description: params[:description])
    # @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  # add edit and update methods here
  def edit
    @article = Article.find(params[:id])
  end

  # def update
  #   # raise params.inspect

  #   @article = Article.find(params[:id])
  #   @article.update(article_params)
  #   redirect_to article_path(@article)
  # end

  def update
    @article = Article.find(params[:id])
    @article.update(title: params[:article][:title], description: params[:article][:description])
    # @article.update(article_params)
    redirect_to article_path(@article)
  end
  # private 

  #   def article_params
  #     params.require(params).permit(:title, :description)
  #   end

end
