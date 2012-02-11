Bestly::Application.routes.draw do

  devise_for :users
#             :controllers => {:sessions => 'devise/sessions'}, 
#             :skip => [:sessions] do
#    get '/login' => 'devise/sessions#new', :as => :new_user_session
#    post '/login' => 'devise/sessions#create', :as => :user_session
#    get '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
#    get '/signup' => 'devise/registrations#new', :as => :new_user_registration

  resources :users
  resources :links do
    member do
      get :vote_up
    end
  end

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/submit', :to => 'links#new'
  
  match '/users/:id', :to => 'users#show',    :as => :user,         :via => :get
  match '/users/:id', :to => 'users#destroy', :as => :destroy_user, :via => :delete

  root :to => 'pages#home'

end
