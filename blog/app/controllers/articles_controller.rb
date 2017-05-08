class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create

        # Create article from parameters
        @article = Article.new(params
            .require(:article)
            .permit(:title, :text))

        # Save article (if applicable)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end

    end

end
