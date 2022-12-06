class SearchController < ApplicationController
  def index
    @searches = Search.all.reverse()
  end
end