class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end
    
    def create
        # @article = Article.new
        # @article.name = params[:name]
        # @article.body = params[:body]

        @article = Article.new(article_params)

        if @article.save 
            redirect_to articles_path
        else 
            render :new
        end

        private

        def article_params
            params.require(:article).permit(:name, :body)
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        @article.update
    end
    
    def delete
        @article = Article.find(params[:id])
        @article.destroy
    end

    private

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
