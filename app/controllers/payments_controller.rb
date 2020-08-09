class PaymentsController < ApplicationController 
    before_action :profile_check  



    def add_funds 
      # p "+++++++++++++++" 
      # p params   
      # p @@amount
      # p "+++++++++++++++" 
    #   session = Stripe::Checkout::Session.create(
    #     payment_method_types: ['card'],
    #     customer_email: current_user.email,
    #     line_items: [{ 
    #         name: "$50",
    #         amount: 50 * 100,
    #         description: "add funds",
    #         currency: 'aud',
    #         quantity: 1,
    #     }],
    #     payment_intent_data: {
    #         metadata: {
    #             user_id: current_user.id,
    #         }
    #     },
    #     success_url: "#{root_url}/#{@current_profile}/inventory",
    #     cancel_url: "#{root_url}listings"
    # )

    # @session_id = session.id   
    
    end  

    def add_funds_10    
      
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{ 
            name: "Add funds: $10",
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
        success_url: "#{root_url}/#{@current_profile}/inventory",
        cancel_url: "#{root_url}listings"
    )

    # @session_id = session.id  
    # Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key) 
    # p Stripe.api_key 
    # redirect_to "https://checkout.stripe.com/pay/#{Stripe.api_key}"

    
    require 'stripe'
    Stripe.api_key = 'sk_test_51GnIHHG3uVO0eVbiZmreSVvxEV1xOjweaZhkCdQXD8KgZR6USXZZnZ41kpPz6BiQRBeuTYgrsu52hhuPO6iXWjBw00P4mjZre2'
    
    Stripe::Checkout::Session.retrieve( sessionId: 'cs_test_HQXBK7Jll7iMmZ9xXsVrky93189q0yZfF1yX2Us3NqK2Bpj30LOpqkPf',
    )      
    end 

    def add_funds_25 
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{ 
            name: "Add funds: $25",
            amount: 25 * 100,
            description: "add funds",
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
            }
        },
        success_url: "#{root_url}/#{@current_profile}/inventory",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id  
   
    end 

    def add_funds_50 
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{ 
            name: "Add funds: $50",
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
        success_url: "#{root_url}/#{@current_profile}/inventory",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id  
    
    end


    def success  
     respond_to do |format|  
      format.html { redirect_to inventory_path(@current_profile), notice: 'Funds Added'} 
     end

    end
    
    
    private 

    def profile_check   
        if current_user
          @current_profile = Profile.find_by(user_id: current_user).id 
        end  
      end  

end