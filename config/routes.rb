Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Home Starts
  get 'home' => 'home#index'
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

  # News Starts
  get 'admin/all_news' => 'news#index'
  post 'admin/news/create' => 'news#create'
  get 'admin/news/new' => 'news#new'
  get 'admin/news/:id/edit' => 'news#edit', as: 'edit_admin_news'
  get 'admin/news/:id' => 'news#show', as: 'admin_news'
  patch 'admin/news/:id' => 'news#update'
  put 'admin/news/:id' => 'news#update'
  delete 'admin/news/:id'  => 'news#destroy'
  get 'news/:id' => 'news#newsDetail', as: 'news'
  # News Ends

  # Events Starts
  get 'events' => 'events#index_show'
  get 'admin/all_events' => 'events#index'
  post 'admin/event/create' => 'events#create'
  get 'admin/event/new' => 'events#new'
  get 'admin/event/:id/edit' => 'events#edit', as: 'edit_admin_event'
  get 'admin/event/:id' => 'events#show', as: 'admin_event'
  patch 'admin/event/:id' => 'events#update'
  put 'admin/event/:id' => 'events#update'
  delete 'admin/event/:id' => 'events#destroy'
  get 'event/:id' => 'events#eventDetail', as: 'event'
  # Events Ends

  # Gallery Starts
  get 'gallery/images' => 'gallery#images'
  get 'gallery/videos' => 'gallery#videos'
  get 'admin/gallery/all_videos' => 'gallery#indexVideos'
  post 'admin/gallery/video/create' => 'gallery#createVideo'
  get 'admin/gallery/video/new' => 'gallery#newVideo'
  get 'admin/gallery/video/:id/edit' => 'gallery#editVideo', as: 'edit_admin_gallery_video'
  get 'admin/gallery/video/:id' => 'gallery#showVideo', as: 'admin_gallery_video'
  patch 'admin/gallery/video/:id' => 'gallery#updateVideo'
  put 'admin/gallery/video/:id' => 'gallery#updateVideo'
  delete 'admin/gallery/video/:id' => 'gallery#destroyVideo'
  # Gallery Ends

  # About Us Starts
  get 'about_us' => 'about_us#index'
  # About Us Ends

  # Contact Us Starts
  get 'contact_us' => 'contact_us#index'
  # Contact Us Ends
end
