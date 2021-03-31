Rails.application.routes.draw do
  resources :posts
  devise_for :users, skip: [:registrations] do
    get "/sign_up" => "devise/registrations#new"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#homepage'
end
