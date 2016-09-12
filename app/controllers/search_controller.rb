class SearchController < ApplicationController
  def index
    response = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{ENV['NREL_KEY']}"
    @parsed_response = JSON.parse(response.body)['fuel_stations']
    @zip = @parsed_response.map do |pr|
      Searcher.new(pr).zip
    end
  end
end

class Searcher
  attr_reader :zip

  def initialize(response_hash)
    @zip = response_hash['zip']
  end
end
