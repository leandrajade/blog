require 'rails_helper'

RSpec.describe 'Categories', type: :request do

    let(:categories) {Category.create(name: 'Sample name')}

    describe "GET #index" do
        it "returns the index page" do
            get categories_path
            expect(response).to have_http_status(:success)
        end
    end

    #1. creates a category that can be used to organize my tasks
    describe "POST #new" do
        it "returns the create page" do
            post categories_path
            expect(response).to have_http_status(:success)
            expect(response).to render_template(:new) 
        end
    end

    # As a User, I want to edit a category to update the category's details

end
