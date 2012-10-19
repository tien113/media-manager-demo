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
      if imdb_url != nil
        imdb_url = URI.parse(imdb_url)
        if imdb_url.path.size == 17
          imdb_id = imdb_url.path[9,7]
          @imovie = Imdb::Movie.new(imdb_id)
          @movie.title     = @imovie.title
          @movie.year      = @imovie.year
          @movie.rating    = @imovie.rating
          @movie.genre     = @imovie.genres.join(", ")
          @movie.imdb_url  = @imovie.url
          @movie.image_url = @imovie.poster
        else
          flash.now[:error] = 'IMDb URL is wrong!'
          @movie.year      = nil
        end
      end
    end
  
end
