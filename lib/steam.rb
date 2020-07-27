require 'httparty'
class Api  
    include HTTParty 
    base_uri "https://steamcommunity.com/market/listings/730" 
    
   
    def all_data  
        self.class.get("https://steamcommunity.com/market/listings/730/StatTrak%E2%84%A2%20AK-47%20%7C%20Blue%20Laminate%20%28Factory%20New%29/render?start=0&count=10&currency=3&language=english&format=json")
    end   
    
    def test  
            response = self.class.get("https://steamcommunity.com/market/listings/730/StatTrak%E2%84%A2%20AK-47%20%7C%20Blue%20Laminate%20%28Factory%20New%29/render?start=0&count=10&currency=3&language=english&format=json")
            response_data = JSON.parse(response.body) 
            p response_data.keys
    end   
  

    def weapon(*details)  
        # order = weapon, first_word, wear, stattrack, second_word   
    self.class.get("/#{details[3].nil? ? details[3] : "StatTrak™%20"}#{details[0]}%20%7C%20#{details[1]}#{details[4].nil? ? details[4] : ("%20" + details[4])}%20%28#{details[2]}%29/render?start=0&count=10&currency=3&language=english&format=json") 

    end   
    
   
end 

# weapon = %w(P2000 USP-S Glock-18 P250 Five-SeveN Tec-9 CZ75-Auto Dual%20Berettas Desert%20Eagle R8%20Revolver Nova XM1014 MAG-7 Sawed-Off MP9 MAC-10 PP-Bizon MP7 UMP-45 P90 MP5-SD FAMAS Galil AR M4A4 M4A1-S AK-47 AUG SG%20553 SSG%2008 AWP SCAR-20 G3SG1 M249 Negev) 
# wear = %w(Field-Tested Well-Worn Factory%20New Battle-Scarred Minimal%20Wear) 
# skins = %w()  

# p HTTParty.get("https://steamcommunity.com/market/listings/730/StatTrak%E2%84%A2%20AK-47%20%7C%20Blue%20Laminate%20%28Factory%20New%29/render?start=0&count=10&currency=3&language=english&format=json", :body => "pagesize") 

@specified_item = Api.new   
# @specified_item.test 

items = { 
    hello: { 
    word: "hello"
    }, 
    goodbye: { 
    word: "goodbye"
    }
} 

# p items.keys

require 'httparty'
class Backpack  
    include HTTParty 
    base_uri "http://csgobackpack.net"
    $all_skins =[]


    # seed this data into the Skins model 
    # then select random name from tabel 
    # for random do Skins.length and make an array of that number then sample it
  

    def skins   
            response = self.class.get("/api/GetItemsList/v2/")
            response_data = JSON.parse(response.body) 
            cleaner = response_data[:items_list].keys.to_s.split("") 
            
            cleaner.map.with_index do |v,i| 
                if v == "|" 
                  @pipe = i + 1  
                  cleaner.delete_if.with_index { |v,i| i <= @pipe}  
                elsif  v == "(" 
                  @bracket = i - 1  
                  cleaner.delete_if.with_index { |v,i| i >= @bracket}  
                end
               
            end  
            Skin.create(name: cleaner.map { |x| x == " " ? '%20' : x }.join)

    end   

  
end   

@mini_database = Backpack.new  
# @mini_database.skins



#  delete value if its lower than found index  
amount = 0  
holder = [] 
cleaner = ["AK-47 | Aquamarine Revenge (thing)","AK-47 | Aquamarine Revenge (thing)","AK-47 | Aquamarine Revenge (thing)"]  
loop do   

if amount == cleaner.length  
   break 
end
 
cleaner[amount].split("").each_with_index do |v,i| 
    if v == "|" 
      @pipe = i + 1  
      cleaner[amount].split("").delete_if.with_index { |v,i| i <= @pipe}  
    elsif  v == "(" 
      @bracket = i - 1  
      cleaner[amount].split("").delete_if.with_index { |v,i| i >= @bracket}  
    end 
end  


p cleaner[amount].split("").each { |x| x == " " ? '%20' : x } 
amount += 1 


end



 



# 1. get response from API
# 2. get "items_list" object/hash from response
# 3. loop through every key in that object/hash to get individual item details
# 4. get the name property from the individual item details

# need key from item list


# "get all names and make array of them"

# ideal out come
# items_list.random