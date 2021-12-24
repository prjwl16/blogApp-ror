# frozen_string_literal: true

class ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show

  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = 'Article was saved successfully'
      redirect_to @article
    else
      render 'new', status: :bad_request
    end
  end

  def edit

  end

  def update
    p @article
    if @article.update(article_param)
      flash[:notice] = 'The article was updated successfully'
      redirect_to articles_path
    else
      render :index
    end
  end

  def destroy

    @article.destroy
    redirect_to articles_path
  end

  def article_param
    params.require(:article).permit(:title, :description)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
end
