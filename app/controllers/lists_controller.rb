class ListsController < ApplicationController
before_action :find_list, only: [ :show, :destroy ]

# GET /lists
def index
  @lists = List.all
  @movies = Movie.all
end

# GET /list/:id
def show
  @bookmark = Bookmark.new
  @movies = Movie.all
end

# GET /lists/new
def new
  @list = List.new
end

# POST /lists
def create
  @list = List.new(list_params)
  if @list.save
    redirect_to list_path(@list)
  else
    render :new
  end
end

def destroy
  @list.destroy
  flash[:success] = "Article deleted"
  redirect_to lists_path, status: :see_other
end

private
  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
