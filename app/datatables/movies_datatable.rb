# encoding: utf-8
class MoviesDatatable
  delegate :params, :h, :link_to, :edit_movie_path, :number_with_precision, :check_box_tag, to: :@view
  
  def initialize(view)
    @view = view
    db_adapter = ActiveRecord::Base.configurations[Rails.env]['adapter']
    @search_query_method = db_adapter == 'postgresql' ? 'ILIKE' : 'LIKE'
  end
  
  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Movie.count,
      iTotalDisplayRecords: movies.total_entries,
      aaData: data     
    }
  end
  
private

  def data
    movies.map do |movie|
      [
        link_to(movie.title, movie, class: "title-color"),
        h(movie.year),
        number_with_precision(movie.rating, :precision => 1) ,
        h(movie.resolution),
        h(movie.genre),
        h(movie.storage),
        check_box_tag('', '', movie.watched, disabled: true),
        link_to('E', edit_movie_path(movie), class: "btn btn-small btn btn-warning") + ' ' +
        link_to('D', movie, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-small btn-danger")
      ]
    end
  end
  
  def movies
    @movies ||= fetch_movies
  end
  
  def fetch_movies
    movies = Movie.order("#{sort_column} #{sort_direction}")
    movies = movies.page(page).per_page(per_page)
    if params[:sSearch].present?
      movies = movies.where("title #{@search_query_method} :search or genre #{@search_query_method} :search", search: "%#{params[:sSearch]}%")
    end
    movies   
  end
  
  def page
    params[:iDisplayStart].to_i/per_page + 1
  end
  
  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end
  
  def sort_column
    columns = %w[title year rating resolution genre storage]
    columns[params[:iSortCol_0].to_i]
  end
  
  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
  
end