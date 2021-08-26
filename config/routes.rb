Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  root to: 'homes#top'
  get '/home/about' => 'homes#about'
 
 
  # 顧客ページ
  namespace :public do
  resources :items, only: [:index, :show]
 end
 
  namespace :public do
  resources :customers, only: [:show, :edit, :update]
 end
 
  namespace :public do
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
 end
 
  namespace :public do
  resources :orders, only: [:new, :comfirm, :complete, :create, :index, :show]
 end
 
  namespace :public do
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