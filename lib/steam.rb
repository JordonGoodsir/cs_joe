require 'httparty' 
class Api  
    include HTTParty 
    base_uri "https://steamcommunity.com/market/listings/730" 
    
   
    def all_data  
        response = self.class.get("https://steamcommunity.com/market/listings/730/StatTrak%E2%84%A2%20AK-47%20%7C%20Vulcan%20%28Factory%20New%29/render?start=0&count=10&currency=3&language=english&format=json")  
        response_data = JSON.parse(response.body) 
        # p"++++++++++++" 
        # # results_html
        # p response_data["results_html"] 
        # p"++++++++++++" 
        p"++++++++++++" 
        # assets
        
        p"++++++++++++" 
     
    end   
    
    def test  
            response = self.class.get("http://csgobackpack.net/api/GetItemPrice/?currency=USD&id=AK-47%20|%20Wasteland%20Rebel%20(Battle-Scarred)&time=7&icon=1")
            response_data = JSON.parse(response.body)
            cleaner = response_data.keys.uniq  
            
  
        end   
  

    def weapon(stat,wep_and_skin,wear)  
    p self.class.get("https://steamcommunity.com/market/listings/730/#{wep_and_skin}%20%28#{wear}%29/render?start=0&count=10&currency=3&language=english&format=json") 

    end   
    
   
end 


populate = Api.new  
 
# #order = stat(anything/nil), weapon/skin,wear  
# rand_wep = Skin.find([*1..Skin.ids.last].sample).name 
# wear = %w(Field-Tested Well-Worn Factory%20New Battle-Scarred Minimal%20Wear) 

# populate.weapon(nil, rand_wep, wear.sample)




