class CommentsController < ApplicationController
    def create
        @gossip = Gossip.find(params[:article_id])
        @comment = @gossip.comments.create(comment_params)
        redirect_to article_path(@gossip)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
