class Admin::GenresController < ApplicationController

  def index
    @genres=Genre.all
    @genre=Genre.new
  end

  def create
    @genre=Genre.new(genre_params)
    @genres=Genre.all
    if @genre.save
      flash[:notice] = "Genre was successfully created."
      redirect_to genre_path(@genre.id)
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end



end
