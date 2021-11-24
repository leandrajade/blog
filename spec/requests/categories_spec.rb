require 'rails_helper'

RSpec.describe 'Categories', type: :request do

    describe "GET #index" do
        it "returns the index page" do
            get categories_path
            expect(response).to have_http_status(:success)
        end
    end

    
    describe "GET #new" do
        it "returns the new page" do
            get new_category_path
            expect(response).to have_http_status(:success)
        end
    end

    describe "POST #create" do
        it "1. creates a category that can be used to organize my tasks" do
            post categories_path, params: { name: 'abcde' }
            expect(response).to have_http_status(302)
        end
    end

    # As a User, I want to edit a category to update the category's details

end
