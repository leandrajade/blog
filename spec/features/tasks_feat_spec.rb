require 'rails_helper'

RSpec.describe "Task", type: :feature do 

    before do
        sign_in create(:user)
    end

    before(:each) do
        @category = Category.find(valid_attributes[:category_id]) 
    end

    describe 'Creates a new Task' do
        before { visit category_path(@category) }

        it 'Successfully create new task' do
            within 'body' do
                expect(page).to have_content 'Tasks'
                expect(page).to have_content 'New Task'

                click_on 'New Task'
            end

            # expect(page).to have_current_path "/"
        end
    end



end