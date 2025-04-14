class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new    
  end

  def edit
    is_matching_login_user
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
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user) 
    else
      render :edit
    end   
  end

private

  def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
end