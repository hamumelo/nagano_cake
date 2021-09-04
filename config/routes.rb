Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
# devise_for :customers, controllers: {
#   sessions:      'customers/sessions',
#   passwords:     'customers/passwords',
#   registrations: 'customers/registrations'
# }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
 
 
  # 顧客ページ
  get '/items' => 'public/items#index'
  get '/items/:id' => 'public/items#show'
  
  get '/customers/sign_up' => 'public/registrations#new', as: 'new_registrations'
  get '/customers/sign_up' => 'public/registrations#new', as: 'new_registration'
  post '/customers' => 'public/registrations#create'
  
  get '/customers/sign_in' => 'public/sessions#new', as: 'new_session'
  post '/customers/sign_in' => 'public/sessions#create', as: 'session'
  delete '/customers/sign_out' => 'public/sessions#destroy', as: 'destroy_session'
  
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/edit' => 'public/customers#edit'
  patch '/customers' => 'public/customers#ediupdate'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  
 scope module: :public do
  resources :cart_items, only: [:index, :update, :destroy, :create]
 end
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  
 scope module: :public do
  resources :orders, only: [:new, :create, :index, :show]
 end
  post '/orders/confirm' => 'public/orders#comfirm'
  post '/orders/complete' => 'public/orders#complete'
  
 scope module: :public do
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
 end

  
  # 管理者ページ
  namespace :admin do
    resources :sessions, only:[:new, :create, :destroy]
 end
    
  namespace :admin do
    resources :homes, only:[:top]
 end
    
  namespace :admin do
    resources :items
 end
    
  namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
 end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
 end

  namespace :admin do
    resources :orders, only:[:show, :update]
 end

  namespace :admin do
    resources :order_details, only:[:update]
 end
 
end