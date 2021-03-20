class CommentsController < ApplicationController
    def index
        comments = Comment.all.includes(:likes, :comments)
        render json: CommentSerializer.new(comments).to_serialized_json
    end

    def create
        comment = Comment.new(comment_params)
        comment.user_id = current_user.id

        if comment.save
            if comment.commentable_type == "Post"
                post = Post.find_by(id: comment.commentable_id)
                render json: PostSerializer.new(post).to_serialized_json
            elsif comment.commentable_type == "Comment"

                render json: CommentSerializer.new(comment).to_serialized_json
            end
        else
            render json: { error: 'Unable to save comment.' }
        end
    end

    private

    def comment_params
        params.require(:comment).permit(
            :content,
            :commentable_type,
            :commentable_id
        )
    end
end
