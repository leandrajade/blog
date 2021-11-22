require 'rails_helper'

RSpec.describe Category, type: :model do
    
    let!(:category) {Category.new}

    context 'Validations' do
        it '1. Is not valid without a name' do
            category.name = nil 

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:name)
        end

        it '3. Is not valid with name length less than 3' do
            category.name = 'ab'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:name)
        end

    end
end


