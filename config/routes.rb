Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Home Starts
  get 'home/index'
  root 'home#index'
  # Home Ends

  # Admin Starts
  get 'admin/index'
  get 'admin' => 'admin#index'
  # Admin Ends

  # Devise Starts
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
  	get "users/sign_in" => "users/sessions#new"
  	get "users/sign_out" => "users/sessions#destroy"
  	# get "users/sign_up" => "devise/registrations#new"
  end
  # Devise Ends

  #News Starts
  get 'admin/all_news' => 'news#index'
  post 'admin/news/create' => 'news#create'
  get 'admin/news/new' => 'news#new'
  #News Ends
end
