class Item < ApplicationRecord
  belongs_to :profile
  belongs_to :listing, optional: true  
  belongs_to :skin

end
