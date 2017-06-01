class MovieController < ApplicationController
  require 'http'
  def index
    # Pull IMDB ID from GET
    imdb = params[:imdb]
    # Send a HTTP GET with IMDB ID to external movie API and receive the movie in JSON
    response = HTTP.get('http://www.omdbapi.com/', :params => {i: imdb, plot: 'full'})
    # Parse JSON to object
    @movie = JSON.parse(response)
  end

  def add_to_watchlist()
    @testvariable = @movie[:imdbID]
  end
end
