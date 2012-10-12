class Movie < ActiveRecord::Base
  attr_accessible :genre, :image_url, :imdb_url, :original_title, 
                  :rating, :resolution, :title, :watched, :year
  
  validates :title            , length: 1..100
  validates :original_title   , length: 0..100
  validates :year             , numericality: true, length: 4..4
  validates :rating           , numericality: true, length: 1..3
  validates :resolution       , length: 1..100
  validates :genre            , length: 1..100
  validates :imdb_url         , length: 1..100
  validates :image_url        , length: 1..255
  
end
