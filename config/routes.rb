Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

 
 
  # 顧客ページ
  
  
  
 scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/customers/my_page' => 'customers#show'
  get '/customers/edit' => 'customers#edit'
  patch '/customers' => 'customers#update'
  get '/customers/unsubscribe' => 'customers#unsubscribe'
  patch '/customers/withdraw' => 'customers#withdraw'
  
  resources :items, only: [:index, :show]
  
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  
  resources :orders, only: [:new, :create, :index, :show]
  post '/orders/confirm' => 'orders#comfirm'
  get '/orders/complete' => 'orders#complete'
  
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end

  devise_for :customers, controllers: {
  sessions:      'public/customers/sessions',
  passwords:     'public/customers/passwords',
  registrations: 'public/customers/registrations'
}
  
  # 管理者ページ
  namespace :admin do
    resources :sessions, only:[:new, :create, :destroy]
    resources :homes, only:[:top]
    resources :items
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show'
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
 end
 
end