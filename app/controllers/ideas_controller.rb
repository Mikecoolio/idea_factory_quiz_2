class IdeasController < ApplicationController
    def new
       @idea = Idea.new 
    end

    def create
        @idea = Idea.new(params.require(:idea).permit(:title, :body))

        if @idea.save
            flash[:notice] = "Successfully created idea"
            redirect_to idea_path(@idea)
        end
    end

    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def show
        @idea = Idea.find(params[:id])
    end

    def edit
        
    end

    def update

    end

    def destroy
        
    end
end
