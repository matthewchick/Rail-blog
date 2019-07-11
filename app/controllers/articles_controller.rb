class ArticlesController < ApplicationController

  # go to new.html.erb
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
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
    @article = Article.find(params[:id])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

end
