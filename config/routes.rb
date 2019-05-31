Rails.application.routes.draw do

  scope '(:locale)' do
  
    match 'search', to:'store#search', as: 'search', via: [:get, :post]

    get '/categories/new/:id', to: 'categories#new', as: 'new_category'
    resources :categories
    resources :news_items
    get 'admin', to: 'admin#index'
    post 'admin', to: 'admin#clean'
    controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end

      
    resources :products do
      get :who_bought, on: :member
    end

    resources :product_images

  
  
    resources :users
    get 'fogot-password', to: 'users#fogot_password'
    post 'fogot-password', to: 'users#change_password'
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
    get '/product/:id', to: 'store#show', as: 'store'
    match '/category/:id', to: 'store#show_cat', as: 'store_cat', via: [:get, :post]
    get 'about', to: 'pages#about'  
    get 'contacts', to: 'pages#contacts'
    get 'news', to: 'pages#news'
  end

end
