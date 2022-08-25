class MovieService

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = ENV['movie_api_key']
    end
  end

  def self.top_rated
    response = conn.get('/3/movie/top_rated')
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movies_by_keyword(keyword)
    response = conn.get('/3/search/movie')
    json = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry 
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}") 
    json = JSON.parse(response.body, symbolize_names: true)
  end
end