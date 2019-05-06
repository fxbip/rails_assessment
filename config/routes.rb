Rails.application.routes.draw do
  devise_for :users
  get "/", to: "mentors#home", as: "root"
  resources :mentors
  get "/mentors/:id/book", to: "mentors#book", as: "book"
  get "/mentors/:id/review", to: "mentors#review", as: "review"
  get "/mentors/:id/reviews", to: "mentors#reviews", as: "reviews"
  post "/mentors/:id/reviews", to: "mentors#createreview"
  get "/success", to: "payments#success", as: "success"
  post "/payments/stripe", to: "payments#stripe"
  
end
