class SearchController < ApplicationController
  def index
    @searches = Search.all
  end
end