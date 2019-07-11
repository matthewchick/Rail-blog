# Section 4
class ArticlesController < ApplicationController
  # make sure before action -> edit, update, show and destroy then call set_article
  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.all    #get all articles from dB:
  end

  # go to new.html.erb
  def new
    @article = Article.new
  end

  def edit

  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)   # go to 'show' action
    else
      render 'edit'
    end
  end

  def create
    # send plain text - with no markup at all - back to the browser by using the :plain option to render:
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    # @article.save
    # redirect_to article_path(@article)
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)   # go to 'show' action
    else
      # if have an error
      render 'new'    # go to 'new' action
    end
  end

  def show

  end

  def destroy

    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to articles_path # go to index

  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
