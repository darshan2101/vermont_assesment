module Api
    module V1
        class AuthController < ActionController::API

            def login 
                user = User.find_by(email: params[:email])&.downcase!&.strip!
                if user&.authenticate(params[:password])
                    token = JsonWebToken.encode(user_id: user.id)
                    render json: {token: token, expires_in: "24h"}, status: :ok

            end
        
    end
end