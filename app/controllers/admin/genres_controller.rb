class Admin::GenresController < ApplicationController

  def index
     @genres = Genre.all
     @genre = Genre.new
  end

  def create
     @genre = Genre.new(genre_params)
     @genre.save
    redirect_to admin_genres_path(@genre.id)
    # if @genre_post.save
    #   flash[:notice] = "genre was successfully created."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   @genres = Genre.all
    #   render :index
    # end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(genre_params[:id])
     @genre.update(genre_params)
    redirect_to admin_genres_path
    # if @genre_post.update
    #   flash[:notice] = "You have updated genre successfully."
    # redirect_to admin_genres_path(@book_new.id)
    # else
    #   render :edit
    # end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end