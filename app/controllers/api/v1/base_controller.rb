module Api
    module V1
        class BaseController < ActionController::API
            before_action: authenticate_request!

            attr_reader :current_user

            private

            def authenticate_request!
                header = request.headers["Authorization"]
                token = header.split("")&.last
                decoded = token && JsonWebToken.decode(token)

                if decoded.nil?
                    render jsomn: {error: "UnAuthorized"}, status: :unauthorized
                    return
                end

                @current_user = User.find_by(id: decoded[:user_id])

                render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
            end

            def require_admin!
                render json: {error: "forbidden" }, status: :forbidden unless @current_user&.admin?
            end

        end
    end
end