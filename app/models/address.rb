class Address < ApplicationRecord
  
  belongs_to :customer, optional: true
  
  validates :name, length: { in: 1..20 }, uniqueness: true
  validates :postal_code, length: {maximum: 7}, presence: true
  validates :address, presence: true
  
def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
end

end
