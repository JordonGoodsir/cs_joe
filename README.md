# Cs:Joe



### Links 

- **Heroku** 
  - https://secure-tor-23597.herokuapp.com/ 
- **Github** 
  - https://github.com/JordonGoodsir/cs_joe/tree/temp 
    - all code is on the temp branch

### Problem we are trying to solve  

- The problem Cs:Joe is trying to solve is the undereducation of sellers and buyers on the steam market.   

### Why is it a problem that needs solving? 

- This being a problem that needs solving as millions of people are left at a loss of money spending on the steam market, more specifically in the context of the Csgo community. This problem being rectified through our risk free trading site, this being the case as users will be given accurate pricing on items, mimicking the market price, however they will not have to user their own items, but rather fake ones. This emulation will enable users to better learn the economic world on Csgo with zero risk.

### User Story

**home page** 

- A user will be greeted by the home page telling of the site and how to use it 
- they will not be required to sign in 
- However if they attempt to sign in and they have not yet made a profile they will be continually prompted until they make one 
- from here they will be able to go to the market and dashboard via navbar   

**Market page**  

- Both 
  
- from the market page the user will be able to see a multitude of listings 
  
- signed in 	

  -  when clicking the buy button they will be taken to a page with the details of that item and be able to proceed with the full purchase via stripe.

- **not signed in**  

  - they will not be required to sign in 
  - until they click the buy button on an item, which will prompt them to sign in 

  **Dashboard** 

  - if the user is not signed in the user will be prompted to sign in upon clicking 
  - form here the user will be able to add money to their account via a add funds button  
    - this taking them to a page where they will be able to add a pre set amount or an amount they specify.
  - they will also be a nav bar specific to this page which will include the following: 
    - **profile**  
      - this page will enable the editing of one profile details
    - **Inventory**  
      - if it is the users first time in inventory they will be able to generate a random amount of items in which they will be able to sell 
        - else they will see all their held items 
      - they will also be able to list their items from here clicking the sell button on the desired weapon, this redirecting them to a sell page
    - **listings** 
      - A user will be able to see the details of their current listings 
      - being able to edit and/or delete listings 
        - if editing they will be redirected to an edit form 



### ERD 

![cs_joe_ERD](/md_images/cs_joe_ERD.PNG)



###  Description  



- **Purpose**    

  - The purpose of Cs:Joe is the emulate the steam market, enabling users to practice with fake currency preparing them for greater real transactions on the market.

- **Functionality / features** 

  - Listing 
  - Buying 
  - Selling 
  - Login 
  - Profile  
  - Stipe Checkout 
  - Add Funds   
  - Market

- **Sitemap**   

  ![site_map](/md_images/site_map.PNG)

- **Screenshots**   

  ![home](/md_images/home.PNG)

  ![home](/md_images/listings.PNG) 

  ![home](/md_images/inventory.PNG) 

  ![market](/md_images/market.PNG) 

  ![add funds](/md_images/add funds.PNG)

- Target audience**  

  - The Target audience of Cs:Joe are people who use the steam market poorly and are looking to improve using the emulation that Cs:Joe provides.

-  **Tech stack (e.g. html, css, deployment platform, etc)** 

  - JavaScript 
  - HTML 
  - CSS  
  - AWS S3
  - Heroku  
  - Ruby 
  - Ruby on Rails 
  - Scss 

  

### Explain the different high-level components (abstractions) in your app 

- Cs:Joe as an app has a plethora of high-level components to ensure the users enjoyable experience. These components including : 
  - **Stripe Checkout** 
    - As apposed to processing payments ourselves we pass on all payment handling to stripe a trusted third party company to handle transactions.  
  - **Market** 
    - This feature allows users listings to be seen and purchased in live time, immersing the user in the emulation of the steam market. 
  - **Listing** 
    - This feature allows users to list items at any price they with (accept 0 or negatives), this emulating the reality of the steam market, teaching the user to be cautions of the price they are listing their item at. This being the case as if the user puts the price too high, the product will not be bought or alternatively the user lists an item of high value too low price they will be losing possible income.

### Detail any third party services that your *app* will use  

- **Gems** 

  -  **Saintly**
    - For validation on username creation, reducing the amount of profanity via name.
  - **Bootstrap (including dependent gems)**   
    - For faster and easier styling, reducing the need to use a css/html file. This will be used throughout the whole styling process of the app.
  - **Simpleform** 
    - For significantly reducing the code required in order to generate a form. This will be used throughout the whole process of the app.
  - **Httparty** 
    - For fetching data from the Csgo backpack api, enabling the use of the data throughout the app, making up the majority of the front end. This will be used once in a seed like ruby file which will filter through the data and put relevant data into the relevant tables in my database.

- **Services**  

  - **Csgo** **backpack** 
    - For obtaining the data needed for the logic and front end of my site, this api giving information such as gun type, price, rarity etc.
  - **Heroku**  
    - For hosting the site, making it readily available to the public via the free plan on Heroku.
  - **PostgreSQL** 
    - The database chosen for storing all data needed in order for the app to become a reality, e.g user data, item data, profile data etc.
  - **AWS s3**  
    - For storing images on a cloud service rather than on local machine and/or repository. This being used only for users profile images as they are dynamic and in abundance, as opposed to static images added by me. 

  

### Describe your projects *models* in terms of the relationships (active record associations) they have with each other   

- **Models** 

  - **Users**   

    - This model contains the users login details
      - has_one :profile 
        - User should only have one profile

  - **Profiles**   

    - ​	This model contains the users profile details e.g username

      -  belongs_to :user 

        - establishes relationship  

          

      -  has_one_attached :picture   

        - allows only one picture 

          

      -  has_many :items  

        - enables multiple items assigned to a person, therefor enabling an inventory

        

      -  has_many :items_to_buy, class_name: "Item", foreign_key: "buyer_id" 

      -  has_many :items_to_sell, class_name: "Item", foreign_key: "seller_id"   

        - self joined 
          - enabling a profile to be mentioned in two different contexts  
            - buyer 
            - seller

      

  - **Skins**   

    - This model contains data of all the skins in Csgo

      -   has_one :listing  

        - states that a skin can only be listed once 

          

      -   has_one :item 

        - states that skins belong to one item(inventory)

  - **Items**   

    - This model contains data of the users inventory

      -  belongs_to :profile 

        - establishes relationship  

          

      -  belongs_to :listing, optional: true  

        - establishes relationship  

        - makes entry optional as when an item is gained it is not yet listed 

          

      -  belongs_to :skin 

        - establishes relationship 

  - **Listings**   

    - This model contains data of all listings a user has made

      -  has_one :item  

        - stating that a listing can only contain one item 

          

      -   belongs_to :buyer, class_name: "Item", optional: true  

        - establishes relationship 

        - makes entry optional as when a listing is made there is not yet a buyer 

          

      -   belongs_to :seller, class_name: "Item"  

        - establishes relationship 

          

      -   belongs_to :skin  

        - establishes relationship 



### Describe your projects *models* in terms of the relationships (active record associations) they have with each other  

- **Models** 

  - **Users**   

    - This model contains the users login details
      - has_one :profile 
        - User should only have one profile

  - **Profiles**   

    - ​	This model contains the users profile details e.g username

      -  belongs_to :user 

        - establishes relationship  

          

      -  has_one_attached :picture   

        - allows only one picture 

          

      -  has_many :items  

        - enables multiple items assigned to a person, therefor enabling an inventory

        

      -  has_many :items_to_buy, class_name: "Item", foreign_key: "buyer_id" 

      -  has_many :items_to_sell, class_name: "Item", foreign_key: "seller_id"   

        - self joined 
          - enabling a profile to be mentioned in two different contexts  
            - buyer 
            - seller

      

  - **Skins**   

    - This model contains data of all the skins in Csgo

      -   has_one :listing  

        - states that a skin can only be listed once 

          

      -   has_one :item 

        - states that skins belong to one item(inventory)

  - **Items**   

    - This model contains data of the users inventory

      -  belongs_to :profile 

        - establishes relationship  

          

      -  belongs_to :listing, optional: true  

        - establishes relationship  

        - makes entry optional as when an item is gained it is not yet listed 

          

      -  belongs_to :skin 

        - establishes relationship 

  - **Listings**   

    - This model contains data of all listings a user has made

      -  has_one :item  

        - stating that a listing can only contain one item 

          

      -   belongs_to :buyer, class_name: "Item", optional: true  

        - establishes relationship 

        - makes entry optional as when a listing is made there is not yet a buyer 

          

      -   belongs_to :seller, class_name: "Item"  

        - establishes relationship 

          

      -   belongs_to :skin  

        - establishes relationship 



### Provide your database schema design  

![cs_joe_ERD](/md_images/cs_joe_ERD.PNG)



### Describe the way tasks are allocated and tracked in your project 

- For allocating and tracking my tasks throughout the project journey I utilised Trello an application that enables you to visualise your tasks in a malleable way, adding them to cards, giving them checklists, labelling priority etc. 
  - My Trello  
    - https://trello.com/b/ote9uTgB/csjoe 
      - Features of Trello I used 
        - Checklists  
          - On a card I had a large topic that was Brocken down into more achievable checklist items
        - Colour Priority  
          - I assigned tasks a colour, this represented their urgency and ultimately dictated their order of completion.
        - Deadline 
          - I set deadline on each of my task so as to have a clear goal in mind and to keep myself on track.



