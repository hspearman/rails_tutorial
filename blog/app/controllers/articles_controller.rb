class ArticlesController < ApplicationController

public

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create

        # Create article from parameters
        @article = Article.new(article_params)

        # Save article (if applicable)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end

    end

    def update

        # Find article by ID
        @article = Article.find(params[:id])

        # Update article (if applicable)
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end

    end

    def destroy
        
        # Find article by ID
        @article = Article.find(params[:id])

        # Delete article
        @article.destroy

        redirect_to articles_path

    end

private

    def article_params
        params.require(:article).permit(:title, :text)
    end

end
