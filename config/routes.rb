Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
	get "/login" => "users/sessions#new"
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
