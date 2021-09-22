class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :addresses, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :cart_items, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) }
#   enum is_active: { true: true, false: false }
  
def full_customer_address
    '〒' + postal_code + ' ' + address + ' ' + name
end
         
end
