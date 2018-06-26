Rails.application.routes.draw do
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  match "/422", :to => "errors#bad_post", :via => :all

  get 'errors/not_found'

  get 'errors/internal_server_error'

  get 'errors/bad_post'

  root to: 'categories#index'

  resources :categories do
    resources :posts
  end
end


# https://mattbrictson.com/dynamic-rails-error-pages

# used the above site in order to handle error pages.
