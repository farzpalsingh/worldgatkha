Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
	get "users/sign_in" => "users/sessions#new"
	get "users/sign_out" => "users/sessions#destroy"
	get "users/sign_up" => "devise/registrations#new"
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
