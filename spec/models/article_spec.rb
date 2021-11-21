require 'rails_helper'

RSpec.describe Article, type: :model do
    
    let!(:article) {Article.new}

    context 'Validations' do
        it '1. Is not valid without a name' do
            article.body = 'Sample body'
            article.name = nil 

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:name)
        end

        it '2. Is not valid without body' do
            article.name = 'Sample name'
            article.body = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:body)
        end
        
        # it '3. creates an article if valid' do
        #     Article.new
        #     article.name = 'Sample name'
        #     article.body = 'Sample body'
        #     article_count = Article.count 

        #     Article.save!
        #     expect(article_count).to eq(1)
        # end 

        it '3. Is not valid with name length less than 3' do
            article.name = 'ab'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:body)
        end

        it '5. Is not valid with body length less than 5' do
            article.body = 'abcd'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_h.keys).to include(:name)
        end
    end
end


