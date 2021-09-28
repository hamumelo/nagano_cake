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




      <%= f.hidden_field :order_id, value: @order_detail.order_id %>
      <%= f.hidden_field :item_id, value: @order_detail.item_id %>
      <%= f.hidden_field :price, value: @order_detail.price %>
      <%= f.hidden_field :amount, value: @order_detail.amount %>
      <%= f.hidden_field :name, value: @order_detail.item.name %>