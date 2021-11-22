require 'rails_helper'


RSpec.describe Category, type: :model do
    
    let!(:category) {Category.new}
  
    it '1. creates a category that can be used to organize my tasks' do
        # Category.create(name: 'Sample name')
        # category.name = 'Sample name'
        category.save
        expect(Category.count).to eq(1)
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


