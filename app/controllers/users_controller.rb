class UsersController < ApplicationController
before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    flash.now[:notice] ='Signed in successfully.'
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
  else
    flash[:book] = "Name is too long (maximum is 20 characters)"
    render 'edit'
  end
  end
  def edit
  	@user = User.find(params[:id])
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
