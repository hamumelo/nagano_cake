class Address < ApplicationRecord
  
  
  belongs_to :customer, optional: true
  
def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
end

end
