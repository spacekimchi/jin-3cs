Rails.application.routes.draw do
  resources :webfonts, only: :index
end
