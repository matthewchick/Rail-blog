class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    #debugger
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"

      redirect_to articles_path   # go to article#index
    else
      # if have an error
      render 'new'    # go to 'new' action
    end
  end

  private
    #def set_article
    #  @article = Article.find(params[:id])
    #end
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
