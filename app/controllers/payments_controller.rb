class PaymentsController < ApplicationController 
    before_action :profile_check  



    def add_funds 

    p params
    end  

    def add_funds_payment  


    end  

    def add_funds_ten  

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{ 
                name: "$10",
                amount: 10 * 100,
                description: "add funds",
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}/payments/success/10",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id 

        # ren script file

    end  
    
    def add_funds_twenty  

        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{ 
                name: "$20",
                amount: 20 * 100,
                description: "add funds",
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}/payments/success/20",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id 

        # ren script file

    end  

    def add_funds_fifty 
    
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: current_user.email,
            line_items: [{ 
                name: "$50",
                amount: 50 * 100,
                description: "add funds",
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    user_id: current_user.id,
                }
            },
            success_url: "#{root_url}/payments/success/50",
            cancel_url: "#{root_url}listings"
        )
    
        @session_id = session.id  
    end 

    def webhook  
        p "+++++++++++++++++++++"
        p params 
        p "+++++++++++++++++++++" 

    end

    def success     
        
        profile = Profile.find(@current_profile) 
        profile.update(wallet: profile.wallet + params[:amount].to_i)
        redirect_to inventory_path(@current_profile), notice: 'Funds Added'  

    end
    
    
    private 

    def profile_check   
        if current_user
          @current_profile = Profile.find_by(user_id: current_user).id 
        end  
      end  

end