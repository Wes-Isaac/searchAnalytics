class BookController < ApplicationController
  def index
    @books = Book.all
  #   @books = Book.group(:title).pluck('title, count(title) as COUNT').sort_by do |t|
  #     t[1]
  # end.reverse.first(1000)
end

  def search
    books = Book.search_by_title(:query)
    render(partial: 'books', locals: {books: books})
  end
end
