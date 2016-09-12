class SearchController < ApplicationController
  def index
    response = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{ENV['NREL_KEY']}"
    @parsed_response = JSON.parse(response.body)['fuel_stations']
    @searcher = @parsed_response.map do |pr|
      Searcher.new(pr)
    end
    @searcher.zip
    @searcher.
    byebug
  end
end

class Searcher
  attr_reader :zip, :station_name

  def initialize(response_hash)
    @zip = response_hash['zip']
    @station_name = response_hash['station_name']
  end
end
