class Listing < ApplicationRecord 
    has_one :item  
    belongs_to :buyer, :class_name "Item", optional: true 
    belongs_to :seller, :class_name "Item"

end
