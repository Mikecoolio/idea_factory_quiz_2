class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)    
    end

    def destroy
        
    end

    private

    def user_params

    end
end
