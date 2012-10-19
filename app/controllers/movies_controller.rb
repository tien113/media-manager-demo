class MoviesController < ApplicationController
  
  before_filter :signed_in_user
  
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
    fetch
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
    fetch
  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to @movie
      # redirect_to movies_url
      flash[:success] = "Movie was successfully created."
    else
      render action: "new"
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id]).destroy
    flash[:success] = "Movie destroyed."
    redirect_to movies_url
  end
  
  private
    def fetch
      imdb_url = params[:imdb_url]
      if validate_imdb_url?(imdb_url)
        @imovie = Imdb::Movie.new(imdb_id(imdb_url))
        @movie.title     = @imovie.title
        @movie.year      = @imovie.year
        @movie.rating    = @imovie.rating
        @movie.genre     = @imovie.genres.join(", ")
        @movie.imdb_url  = @imovie.url
        @movie.image_url = @imovie.poster
      end
    end
    
    def validate_imdb_url?(url)
      if url != nil && url.include?('http://www.imdb.com/title/tt') && url.size == 36
        return true
      else
        return false
      end
    end
    
    def imdb_id(url)
      url[28,7]
    end
  
end
