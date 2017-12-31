Rails.application.routes.draw do

  resources :topics do
    get '/bookmark' => 'topics#bookmark'
    post '/add' => 'topics#add', as: :add
    get '/bookmark_remove' => 'topics#bookmark_remove'
    delete '/remove' => 'topics#remove', as: :remove
  end

  devise_scope :user do
    get "/sign_in" => "devise/sessions#new"
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end
  
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  get 'welcome/about'
  
  authenticated :user do
    root to: 'topics#index', as: :authenticated_root
  end
  
  root 'welcome#index'
end
