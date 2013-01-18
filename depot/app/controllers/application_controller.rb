class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    def current_cart
        # find the cart with the given id, return the cart
        Cart.find(session[:cart_id])
        # if it's not found, then create a new cart and set 
        # it in the session and return the cart
        rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

    def current_count
        if session[:counter].nil?
            session[:counter] = 1
        else
            session[:counter] += 1
        end
        session[:counter]
    end

    def reset_count
        session[:counter] = 0
    end

end
