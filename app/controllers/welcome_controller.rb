class WelcomeController < ApplicationController
  def index
    response = Faraday.get "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{ENV['NREL_KEY']}"
    @parsed_response = JSON.parse(response.body)
  end
end
