class IdeasController < ApplicationController
    def new
       @idea = Idea.new 
    end

    def create
        @idea = Idea.new(params.require(:idea).permit(:title, :body))
    end

    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def edit
        
    end

    def update

    end

    def destroy
        
    end
end
