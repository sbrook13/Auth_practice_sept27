class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create]
    
    def create
        @user = User.create({
            username: params[:username],
            password: params[:password]
        })
        render json: {user: @user}, status: :created
    end
end
