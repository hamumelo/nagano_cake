class Address < ApplicationRecord
  
  # has_many :orders, dependent: :destroy
  belongs_to :customer, optional: true
  
def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
end

end
