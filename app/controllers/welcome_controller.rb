class WelcomeController < ApplicationController
  def index
    @connection = Faraday.get "https://kM71RdxKpMZmTXWP3q36xEAGSruLqKmiMcBxSKKB@api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1"
  end
end
