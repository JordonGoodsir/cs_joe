class Profile < ApplicationRecord 
 belongs_to :user  
 has_one_attached :picture   
 has_many :items  
 has_many :items_to_buy, class_name: "Item", foreign_key: "buyer_id" 
 has_many :items_to_sell, class_name: "Item", foreign_key: "seller_id" 


validates :username, uniqueness: true 

validates :correct_document_type, presence: true 

validates :clean_name, presence: true 

private 

def clean_name  
  if Saintly.sanitize(username).split("").include?("*")  
    errors.add(:username, 'Appropriate PLEASE!')  
    return false 
  else 
    return true 
  end
end 

def correct_document_type 
  if picture.attached? and !picture.content_type.in?(%w(image/png image/jpeg))
    errors.add(:picture, 'Must be a image file!') 
    return false    
else 
    return true 
end
end  




end
