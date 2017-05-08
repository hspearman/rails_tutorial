class CommentsController < ApplicationController

    http_basic_authenticate_with name: 'dhh', password: 'secret', only: :destroy

public
    def create

        # Find article by ID
        @article = Article.find(params[:article_id])

        # Create comment on article
        @comment = @article.comments.create(comment_params)

        redirect_to article_path(@article)
    end

    def destroy

        # Find article / comment by ID
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])

        # Delete comment
        @comment.destroy

        redirect_to article_path(@article)

    end

private

    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end

end
