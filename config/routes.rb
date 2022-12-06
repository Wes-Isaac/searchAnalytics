Rails.application.routes.draw do
get "search/index"
resources :book, only: [:index]
get "/search", to: "search#index"
get "book/search", to: "book#search"
root "book#index"
end
