Rails.application.routes.draw do

  get '/categories/new/:id', to: 'categories#new', as: 'new_category'
  resources :categories
  resources :news_items
  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  get 'about' => 'pages#about'
  get 'contacts' => 'pages#contacts'
  get 'news' => 'pages#news'

  scope '(:locale)' do
    resources :users
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
    get '/product/:id', to: 'store#show', as: 'store'
    get '/category/:id', to: 'store#show_cat', as: 'store_cat'
  end

end
