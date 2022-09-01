class ListsController < ApplicationController
before_action :find_list, only: [ :show, :destroy ]

def destroy
  @list.destroy
  flash[:success] = "Article deleted"
  redirect_to list_path(list), status: :see_other
end

def index
  @lists = List.all
end

def new
  @list = List.new
end

def create
  @list = List.new(list_params)
  if @list.save
    redirect_to list_path(@list)
  else
    render :new
  end
end

def show
end


private
  def list_params
    params.require(:list).permit(:name)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
