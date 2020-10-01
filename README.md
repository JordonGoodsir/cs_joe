# Cs:Joe

### Link to Site 

- https://secure-tor-23597.herokuapp.com/

### Problem we are trying to solve  

- The problem Cs:Joe is trying to solve is the undereducation of sellers and buyers on the steam market.   

### Why is it a problem that needs solving? 

- This being a problem that needs solving as millions of people are left at a loss of money spending on the steam market, more specifically in the context of the csgo community. This problem being rectified through our risk free trading site, this being the case as users will be given accurate pricing on items, mimicking the market price, however they will not have to user their own items, but rather fake ones. This emulation will enable users to better learn the economic world on csgo with zero risk.

### User Story 



home page 

- A user will be greeted by the home page telling of the site and how to use it 
- they will not be required to sign in 
- However if they attempt to sign in and they have not yet made a profile they will be continually prompted until they make one 
- from here they will be able to go to the market and dashboard via navbar   

Market page  

- Both 
  - from the market page the user will be able to see a multitude of listings 

- signed in 	

  -  when clicking the buy button they will be taken to a page with the details of that item and be able to proceed with the full purchase via stripe.

- not signed in  

  - they will not be required to sign in 
  - until they click the buy button on an item, which will prompt them to sign in 

  Dashboard 

  - if the user is not signed in the user will be prompted to sign in upon clicking 
  - form here the user will be able to add money to their account via a add funds button  
    - this taking them to a page where they will be able to add a pre set amount or an amount they specify.
  - they will also be a nav bar specific to this page which will include the following: 
    - profile  
      - this page will enable the editing of one profile details
    - Inventory  
      - if it is the users first time in inventory they will be able to generate a random amount of items in which they will be able to sell 
        - else they will see all their held items 
      - they will also be able to list their items from here clicking the sell button on the desired weapon, this redirecting them to a sell page
    - listings 
      - A user will be able to see the details of their current listings 
      - being able to edit and/or delete listings 
        - if editing they will be redirected to an edit form
