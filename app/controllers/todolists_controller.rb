class TodolistsController < ApplicationController
  def index
  	@list = List.new
    @lists = List.all
  end
  def new
    @lists = List.all
  end
  def create
  	list = List.new(list_params)
  	list.save
  	redirect_to todolist_path(list.id)
    flash[:todolist] = 'Book was successfully created.'
  end
  def show
    @list = List.find(params[:id])
  end
  def edit
    @list = List.find(params[:id])
  end
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
    flash[:todolist_edit] = 'Book was successfully updated.'
  end
  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
    flash[:todolist] = 'Book was successfully destroyed.'
  end

  private
  def list_params
  	params.require(:list).permit(:title, :body )
  end
  
end
