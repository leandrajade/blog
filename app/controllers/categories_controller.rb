class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @categories = Category.new
    end

    def show
        @category = Category.find(params[:id])
    end
    
    def create
        @category = Category.create(category_params)

        if @category.save 
            redirect_to categories_path
        else
            render :new
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        
        if @category.update(category_params)
            redirect_to categories_path
        end
    end
    
    def delete
        @category = Category.find(params[:id])
        @category.destroy

        redirect_to categories_path
    end

    private

    def category_params
        params.permit(:name)
    end
end
