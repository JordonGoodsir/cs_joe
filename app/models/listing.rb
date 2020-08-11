class Listing < ApplicationRecord 
    has_one :item  
    belongs_to :buyer, class_name: "Item", optional: true 
    belongs_to :seller, class_name: "Item" 
    belongs_to :skin  


    validates :money, presence: true 

    private 

    def money 
        
        if selling_price <= 0 
            errors.add(:selling_price, ' Must Be Higher Please!') 
            return false 
        else
            return true 
        end
    end
end
