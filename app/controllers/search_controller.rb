class SearchController < ApplicationController
  def index
    response = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{ENV['NREL_KEY']}"
    @parsed_response = JSON.parse(response.body)['fuel_stations']
    @parsed_response.map do |pr|
      Search.new(pr)
      byebug
    end
  end
end

class Search
  def initialize(response_hash)
    @zip = response_hash['zip']
  end
end
