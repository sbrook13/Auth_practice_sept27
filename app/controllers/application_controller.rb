class ApplicationController < ActionController::API
    def authenticate
        header = request.headers["Authorization"]

        if !header
            render json: {error: "No Token"}, status: :unauthorized
        else
            begin
                token = header.split(" ")[1]
                secret = "secretSECRETSHhh"
                payload = JWT.decode(token, secret)[0]

                @user = User.find payload["user_id"]
            rescue
                render json: {error: "Bad Token"}, status: :unauthorized
            end
        end
    end
end
