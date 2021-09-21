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




    <%= f.hidden_field :customer_id, value: @customer.id %>
    <%= f.hidden_field :image, value: @item.image_id %>
    <%= f.hidden_field :name, value: @item.name %>
    <%= f.hidden_field :price, value: @item.price %>