class Listing < ApplicationRecord 
    has_one :item  
    belongs_to :buyer, class_name: "Item", optional: true 
    belongs_to :seller, class_name: "Item" 
    belongs_to :skin  


    validates :money, presence: true  

    validates :listings_size?, presence: true 

    private  

    def listings_size? 

        if selling_price.to_s.chars.length > 7 
          errors.add(:selling_price, 'too much')  
          return false   
        else 
          return true
        end 
    end

    def money  
        
        if selling_price <= 0 
            errors.add(:selling_price, ' Must Be Higher Please!') 
            return false 
        else
            return true 
        end
    end
end
