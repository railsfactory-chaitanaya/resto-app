class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        stored_location_for(resource) || home_index_url
    end
    def after_sign_out_path_for(resource)
        stored_location_for(resource) || home_index_url
    end

    private
        def set_cart
            @cart = Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound 
            @cart = Cart.create 
            session[:cart_id] = @cart.id
        end
end
