class MoviesController < ApplicationController
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: MoviesDatatable.new(view_context) }
    end
  end
  
  def show
    @movie = Movie.find(params[:id])
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(params[:movie])
      redirect_to @movie
      flash[:success] = "Movie was successfully updated." 
    else 
      render action: "edit"
    end
  end

  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to @movie
      flash[:success] = "Movie was successfully created."
    else
      render action: "new"
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id]).destroy
  end
  
end
