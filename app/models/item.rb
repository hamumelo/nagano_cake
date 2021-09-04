class Item < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
         
  attachment :image
  
  default_scope -> { order(created_at: :desc) }

  def with_tax_price
    (price * 1.1).floor
  end

end
