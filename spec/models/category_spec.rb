require 'rails_helper'


RSpec.describe Category, type: :model do
    
    let(:category) {Category.create(name: 'Sample name category')}

    describe 'creates a new category' do
        it '1. creates a category that can be used to organize my tasks' do
            expect { category }.to change { Category.count }.by(1)
        end
    end

    context 'Validations' do
        it 'Is not valid without a name' do
            category.name = nil 

            expect(category).to_not be_valid
            expect(category.errors).to be_present
            expect(category.errors.to_hash.keys).to include(:name)
        end

        it 'Is not valid with characters more than 20' do
            category.name = 'abcdefghijklmnopqrstu'

            expect(category).to_not be_valid
            expect(category.errors).to be_present
            expect(category.errors.to_hash.keys).to include(:name)
        end
    end
end


