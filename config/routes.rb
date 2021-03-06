Rails.application.routes.draw do

  get 'movies/' => 'movie#index', as: 'get_movies'
  # get 'movie/index'
  get 'movie/:imdb' => 'movie#index', as: 'get_movie'
  post 'movie/:imdb' => 'movie#add'
  delete 'movie/:imdb' => 'movie#delete', as: 'delete_movie'
  get 'search_genres/' => 'movie#search'

  get 'profile/index', to: 'profile#index', as: 'profile'
  delete 'profile/:imdb_id', to: 'profile#delete', as: 'delete'

  controller :error_pages do
    get :user_already_logged_in
    get :user_not_admin
    get :user_not_logged_in
  end
  # get 'error_pages/user_not_logged_in', to: 'error_pages#user_not_logged_in', as: 'user_not_logged_in'
  # get 'error_pages/user_not_admin', to: 'error_pages#user_not_admin', as: 'user_not_admin'
  # get 'error_pages/user_not_admin', to: 'error_pages#user_not_admin', as: 'user_not_admin'

  get 'session/logout', to: 'sessions#logout', as: 'logout_session'
  post 'session/create', to: 'sessions#create', as: 'create_session'

  get 'imdb_top250/:id' => 'imdb_top_250s#show'

  root 'pages#front_page'

  controller :pages do
    get :front_page
    get :filter_page
  end

  resources :imdb_top250s, only: [:index, :show]
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
