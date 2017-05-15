Rails.application.routes.draw do
  #devise_for :users
  get 'home/index'

  resources :builds
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :skip => [:sessions, :registrations, 
                              :confirmations, :passwords]  
  devise_scope :user do
    get "signin", :to => "devise/sessions#new", :as => :new_user_session
    post 'signin', :to => 'devise/sessions#create', :as => :user_session
    match 'signout', :to => 'devise/sessions#destroy', :as => :destroy_user_session
   
    get 'signup', :to => 'registrations#new', :as => :new_user_registration
    post 'signup', :to => 'registrations#create', :as => :user_registration
    
    get 'confirm/send', :to => 'devise/confirmations#new', :as => :new_user_confirmation
    post 'confirm', :to => 'devise/confirmations#create', :as => :user_confirmation
    get 'confirm/:confirmation_token', :to => 'devise/confirmations#show',
                                       :as => :confirmation

    get 'password/forget', :to => 'devise/passwords#new', :as => :new_user_password
    post 'password', :to => 'devise/passwords#create', :as => :user_password
    get 'password/reset/:reset_password_token', 
          :to => 'devise/passwords#edit', :as => :edit_user_password
    put 'password', :to => 'devise/passwords#update', :as => :user_password
  end
end
