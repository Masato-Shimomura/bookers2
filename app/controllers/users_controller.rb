class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new    
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
  end    

  def update
    @user = User.find(params[:id]) 
    @user_id = current_user.id
    if @user.update(user_params) 
       redirect_to user_path(@user) 
    else
      render :edit
    end   
  end

private

  def user_params
  params.require(:user).permit(:name, :profile_image)
  end
end
