require 'rails_helper'

RSpec.describe 'Category', type: :model do
    
    let(:category) {Category.create(name: 'Sample name category')}

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

        it "Is not valid when name is not unique" do
            category_duplicate = Category.create(name: 'Sample name category')

            expect(category).to_not be_valid
            expect(category.errors).to be_present
            expect(category.errors.to_hash.keys).to include(:name)
        end
    end
end


