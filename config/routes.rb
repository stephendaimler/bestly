Bestly::Application.routes.draw do

  devise_for :users 
#              :controllers => {:registrations => "registrations"}
#             :controllers => {:sessions => 'devise/sessions'}, 
#             :skip => [:sessions] do
#    get '/login' => 'devise/sessions#new', :as => :new_user_session
#    post '/login' => 'devise/sessions#create', :as => :user_session
#    get '/signout' => 'devise/sessions#destroy', :as => :destroy_user_session
#    get '/signup' => 'devise/registrations#new', :as => :new_user_registration

#  match '/check_username/:username', :to => 'users#check_username'
 
  resources :users do
    collection do
      get 'check_username'
      get 'check_email'
    end
  end
  
  resources :links do
    member do
      post :vote_up 
      post :vote_down
    end
  end

  match '/about',   :to => 'pages#about'
  match '/submit', :to => 'links#new'
  
  match '/users/:id', :to => 'users#show',    :as => :user,         :via => :get
  match '/users/:id', :to => 'users#destroy', :as => :destroy_user, :via => :delete

  root :to => 'pages#home'

end
