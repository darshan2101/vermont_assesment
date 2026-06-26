class JsonWebToken
    ALGORITHM = "HS256".freeze

    EXPIRY = 24.hour

    class << self 
        def encode 
            payload = payload.dup
            payload[:exp] = EXPIRY.from_now.to_i
            JWT.enode(payload, secret, ALGORITHM)
        end

        def decode
            decoded = JWT.decode(token, secret, true, algorithm: ALGORITHM)[0]
            HashWithIndifferentAccess.new(decoded)
        rescue JWT::EXPiredSignature, JWT::DecodeError
            nil
        end

        private
            def secret
                Rails.application.credentials.secret_key_base || Rails.application.secret_key_base
            end
