class Movie < ActiveRecord::Base
  attr_accessible :genre, :image_url, :imdb_url, :original_title, 
                  :rating, :resolution, :title, :watched, :year, :storage
  
  before_save { self.title.strip! }
  before_save { self.original_title.strip! }                
  before_save { self.genre.strip! }
  before_save { self.imdb_url.downcase! }
  
  validates :title            , length: 1..100, 
                                uniqueness: { case_sensitive: true }
  validates :original_title   , length: 0..100
  validates :year             , numericality: true, length: 4..4
  validates :rating           , numericality: true, length: 1..3
  validates :resolution       , length: 0..10
  validates :genre            , length: 1..40
  validates :imdb_url         , length: 1..50,
                                format: URI::regexp(%w(http https)),
                                uniqueness: { case_sensitive: false }
  validates :image_url        , length: 1..255,
                                format: URI::regexp(%w(http https))
  validates :storage          , length: 0..20
  
end
