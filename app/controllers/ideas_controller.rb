class IdeasController < ApplicationController
    before_action :find_idea, only: [:show, :edit, :update, :destroy]

    def new
       @idea = Idea.new 
    end

    def create
        @idea = Idea.new(idea_params)

        if @idea.save
            flash[:notice] = "Successfully created idea"
            redirect_to idea_path(@idea)
        else
            render :new
        end
    end

    def index
        @ideas = Idea.order(created_at: :desc)
    end

    def show
    end

    def edit
        
    end

    def update
        if @idea.update(idea_params)
            flash[:notice] = "Successfully updated idea"
            redirect_to idea_path(@idea)
        else
            render :edit
        end
    end

    def destroy
        if @idea.present?
            @idea.destroy
        else
            flash[:alert] = "Failed to destroy this idea"
        end
        redirect_to ideas_path
    end

    private

    def find_idea
        @idea = Idea.find(params[:id])
    end

    def idea_params
        params.require(:idea).permit(:title, :body)
    end
end
