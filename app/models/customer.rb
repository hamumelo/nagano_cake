class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :addresses, dependent: :destroy
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
  
  default_scope -> { order(created_at: :desc) }
  
  validates :email, presence: true
  validates :last_name, length: { in: 1..20 }, uniqueness: true
  validates :first_name, length: { in: 1..20 }, uniqueness: true
  validates :last_name_kana, length: { in: 1..20 }, uniqueness: true
  validates :first_name_kana, length: { in: 1..20 }, uniqueness: true
  validates :postal_code, length: {maximum: 7}, presence: true
  validates :address, presence: true
  validates :telephone_number, length: {maximum: 11}, presence: true

end
