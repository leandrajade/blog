require 'rails_helper'

RSpec.describe 'Categories', type: :request do

    let!(:categories) {Category.new}

    describe "GET #index" do
        it "returns the index page" do
            get categories_path
            expect(response).to have_http_status(:success)
        end
    end
end
