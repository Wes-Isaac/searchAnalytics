class BookController < ApplicationController
  before_action :check_session, only: [:search]

  def index
    @books = Book.all
  end

  def search
    books = Book.search_by_title(params[:query])
    # books = PgSearch.multisearch(params[:query])
    # books = Book.where('title LIKE ?', "%#{params[:query]}%").first(100)
    render(partial: 'books', locals: {books: books})
    check_search(params[:query], session[:user_id])
  end

  #   if turbo_frame_request?
  #   else
  #     render :index
  #   end
  
  
  private

  def check_search(query, session) 
    return if query.nil? || query.length < 4

    last_search = Search.new(book_params)
    last_search.session_id = session
    # last_search.search_by_query(query)
    this_session = Search.where(session_id: session).last
    # if this_session.nil? || !(this_session.search_by_query(query).length)
    if this_session.nil? || !this_session.exists?(query)
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