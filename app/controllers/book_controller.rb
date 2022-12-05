class BookController < ApplicationController
  def index
    @books = Book.all
  end

  def search
  end
end
