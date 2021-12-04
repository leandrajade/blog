class CategoriesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def show
        @category = Category.find(params[:id])
        @tasks = @category.tasks
    end
    
    def create
        @category = Category.new(category_params)

        respond_to do |format|
            if @category.save
              format.html { redirect_to categories_path, notice: "Task was successfully created." }
              format.json { render :show, status: :ok, location: categories_path}
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @category.errors, status: :unprocessable_entity }
            end
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
    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy

        redirect_to categories_path
    end

    private

    def category_params
        params.require(:category).permit(:name)
    end
end
