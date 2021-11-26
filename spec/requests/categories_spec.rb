require 'rails_helper'

RSpec.describe 'Categories', type: :request do

    let(:category) {Category.create(name: 'Sample name category')}
    
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

    describe "GET #show" do
        it "3. I want to view a category to show the category's details" do
            get category_path(category)
            expect(response).to have_http_status(:success)
        end
    end

    describe "GET #edit" do
        it "2. I want to edit a category to update the category's details" do
            get edit_category_path(category)
            expect(response).to have_http_status(:success)
        end
    end

    describe "POST #create" do
        it "1. creates a category that can be used to organize my tasks" do
            post categories_path, params: { category: {name: "abcdefgh" } }
            expect(response).to have_http_status(302)
        end
    end
end
