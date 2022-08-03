require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe "#new" do
        it "requires to render the new template" do
            get(:new)

            expect(response).to render_template(:new)
        end

        it "requires setting an instance variable for a new idea" do
            get(:new)

            expect(assigns(:idea)).to(be_a_new(Idea))
        end
    end

    describe "create" do
        def valid_request
            post(:create, params: {
                idea: FactoryBot.attributes_for(:idea)
            })
        end

        context "with valid parameters" do
            it "requires the new creation of an idea" do
                count_before = Idea.count

                valid_request

                count_after = Idea.count
                expect(count_after).to eq(count_before + 1)
            end

            it "requires a redirect to the show page for an new idea" do
                valid_request

                idea = Idea.last
                expect(response).to(redirect_to(idea_path(idea.id)))
            end
        end

        context "with invalid parameterss" do
            def invalid_request
                post(:create, params: {
                    idea: FactoryBot.attributes_for(:idea, title: nil, body: nil)
                })
            end

            it "requires that the database does not save a new record of the idea" do
                count_before = Idea.count

                invalid_request

                count_after = Idea.count
                expect(count_after).to eq(count_before)
            end

            it "requires no redirect and renders the new page instead" do
                invalid_request

                expect(response).to render_template(:new)
            end
        end
    end



end
