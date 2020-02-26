class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new
    @books = Book.all
  end
  def new
    @books = Book.all
  end
  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  	redirect_to book_path(@book.id)
    flash[:book] = 'Book was successfully created.'
  else
    @books = Book.all
    render :index
  end
  end
  def show
    @book = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:book_edit] = 'Book was successfully updated.'
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:book] = 'Book was successfully destroyed.'
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id )
  end
end
