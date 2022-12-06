class BookController < ApplicationController
  before_action :check_session, only: [:search]

  def index
    @books = Book.all
  end

  def search
    books = Book.search_by_title(params[:query])
    if params[:query].length == 0
      books = Book.all
    end

      render(partial: 'books', locals: {books: books})
      check_search(params[:query], session[:user_id])

  end
  
  
  private

  def check_search(query, session) 
    return if query.nil? || query.length < 4

    last_search = Search.new(book_params)
    last_search.session_id = session
    this_session = Search.where(session_id: session).last
    if this_session.nil? || !this_session.isPresent?(query)
      last_search.save
    elsif this_session.query.length < query.length
      this_session.update(query: query)
    end

  end
  
  def book_params
    params.permit(:query)
  end
 
  
  def check_session
    session[:user_id] = SecureRandom.urlsafe_base64(16) if session[:user_id].nil?
  end
end