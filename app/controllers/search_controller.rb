class SearchController < ApplicationController
  def index
    @search = Search.all
  end
end