require 'httparty'
class Backpack  
    include HTTParty  

        @@accepted = [] 
            def time_saver   
                response = self.class.get("http://csgobackpack.net/api/GetItemsList/v2/")
                response_data = JSON.parse(response.body) 
                cleaner = response_data["items_list"]   
    
                cleaner.each do |k,v|  
                    if v["type"] == "Weapon" 
                        @@accepted.push(k)
                    end
                end     
             
                @@accepted.each do |v|  

                    begin  
                        if cleaner[v]["price"].keys[0].class != String
                         raise
                        else  
                            recency = cleaner[v]["price"].keys[0] 
                            price = cleaner[v]["price"][recency]["average"]
                        end
                    rescue 
                        price = "unknown"
                    end 
                    p price   

                #     begin
                #     opening = v.split("").index("(")
                #     wear = v.split("").delete_if.with_index { |v,i| i <= opening or v == ")"}.join  
                #     rescue  
                #         wear = "unknown"
                #     end  

                #     if cleaner[v].include?("stattrack") and cleaner[v].include?("knife_type")
                #         # create skin as stattrack and inset knife type into gun_type  
                #         Skin.create(wear: wear, icon_url: cleaner[v]["icon_url"] , average_price: price , rarity: cleaner[v]["rarity"] , rarity_color: cleaner[v]["rarity_color"] , name: v, weapon_type: cleaner[v]["weapon_type"] ,gun_type: cleaner[v]["knife_type"] , stat_track: "StaTrack")   
                #         # Skin.create(icon_url: cleaner[v]["icon_url"] , rarity: cleaner[v]["rarity"] , rarity_color: cleaner[v]["rarity_color"] , name: v,gun_type: cleaner[v]["knife_type"] , stat_track: "StaTrack")  
                #     elsif cleaner[v].include?("knife_type") 
                #         # create knife as normal, by inseting knife type into gun_type   
                #         Skin.create(wear: wear, icon_url: cleaner[v]["icon_url"] , average_price: price , rarity: cleaner[v]["rarity"] , rarity_color: cleaner[v]["rarity_color"] , name: cleaner[v]["name"], weapon_type: cleaner[v]["weapon_type"] ,gun_type: cleaner[v]["knife_type"] , stat_track: "no") 
                    
                #     elsif cleaner[v].include?("stattrack")
                #         # create skin as non statrack as usual   
                #         Skin.create(wear:cleaner[v]["exterior"], icon_url: cleaner[v]["icon_url"] , average_price: price , rarity: cleaner[v]["rarity"] , rarity_color: cleaner[v]["rarity_color"] , name: cleaner[v]["name"], weapon_type: cleaner[v]["weapon_type"] ,gun_type: cleaner[v]["gun_type"] , stat_track: "StaTrack")
                #     else  
                #         # create normal weapon 
                #         Skin.create(wear:cleaner[v]["exterior"], icon_url: cleaner[v]["icon_url"] , average_price: price , rarity: cleaner[v]["rarity"] , rarity_color: cleaner[v]["rarity_color"] , name: cleaner[v]["name"], weapon_type: cleaner[v]["weapon_type"] ,gun_type: cleaner[v]["gun_type"] , stat_track: "no")
                #     end 
            
                end   
            end
    end  


@mini_database = Backpack.new   
@mini_database.time_saver 

# cl
# more want  
# average price 
# icon url 
# rarity 
# rarity color 
# weapon_type 
# gun_type 
# stat_track 


# -----------KEYS TEST----------- 


# arr = [1,2,3,4]
# begin
#     arr.each do |v|  
#         if v.class != String  
#             raise 
#         end 
#     end
# rescue => error 
#     selected = arr[0]
#     p selected
# end 


# strings = []
# items = { 
#     hyper: { 
#     "word": "hello", 
#     "type_gun": "ak"
#     }, 
#     golden: {  
#     "word": "hello",   
#     "type_knife": "weapon"
#     }
# }  

# items.each  do |k,v|   

#     if (v.include?(:word)) and (v.include?(:type_knife) or v.include?(:type_gun)) 
#         p "hi" 
#     end
# end



# -----------ITEMS TEST----------- 

# holder = [] 
# amount = 0  
# cleaner = ["ak-47 | skin (skin)","AK-47 | Aquamarine Revenge (thing)","AK-47 | Aquamarine Revenge (thing)"]   
# p cleaner[0]
# opening = cleaner[0].split("").index("(")

# p cleaner[0].split("").delete_if.with_index { |v,i| i <= opening or v == ")"}






# loop do   

# if amount == cleaner.length  
#    break 
# end
 
# cleaner[amount].split("").map.with_index do |v,i| 
#     if v == "|" 
#       @pipe = i  
#       @pipe_stop = i - 1
#     elsif  v == "(" 
#       @bracket = i - 1  
#     end 
# end    

# almost = cleaner[amount].split("").delete_if.with_index { |v,i| i >= @bracket or ((i >= @pipe_stop) and (i <= @pipe))}.index(" ") 

# p cleaner[amount].split("").delete_if.with_index { |v,i| i >= @bracket or ((i >= @pipe_stop) and (i <= @pipe))}.insert(almost,"%207C").map { |x| x == " " ? '%20' : x }.join


# # almost.split("").index("%20")  
# # .map { |x| x == " " ? '%20' : x }.join

# # holder.push(cleaner[amount].split("").delete_if.with_index { |v,i| i >= @bracket or ((i >= @pipe_stop) and (i <= @pipe))}.map { |x| x == " " ? '%20' : x }.join) 
# amount += 1 


# end  


# p "hi"
#  p holder



# 1. get response from API
# 2. get "items_list" object/hash from response
# 3. loop through every key in that object/hash to get individual item details
# 4. get the name property from the individual item details