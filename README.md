# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



  namespace :admin do
    get '/admin/sign_in' => 'admin/sessions#new', as: 'new_admin_session'
    post '/admin/sign_in' => 'admin/sessions#create', as: 'admin_session'
    delete '/admin/sign_out' => 'admin/sessions#destroy', as: 'admin_session'
 end