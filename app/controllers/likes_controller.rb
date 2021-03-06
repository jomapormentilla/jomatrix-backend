class LikesController < ApplicationController
    def create
        like = Like.new(like_params)
        like.user_id = current_user.id

        if like.save
            if like_params[:likeable_type] == "Post"
                post = Post.find_by(id: like.likeable_id)
                render json: PostSerializer.new(post).to_serialized_json
            elsif like_params[:likeable_type] == "Comment"
                comment = Comment.find_by(id: like.likeable_id)
                render json: CommentSerializer.new(comment).to_serialized_json
            end
        else
            render json: { error: 'Something went wrong.' }
        end
    end

    def destroy
        like = Like.all.find_by(id: params[:id].to_i)

        if !!like
            if like.likeable_type == "Post"
                post = Post.find_by(id: like.likeable_id)
                like.delete
                render json: PostSerializer.new(post).to_serialized_json
            elsif like.likeable_type == "Comment"
                comment = Comment.find_by(id: like.likeable_id)
                like.delete
                render json: CommentSerializer.new(comment).to_serialized_json
            end
            
        else
            render json: { error: 'Something went wrong!' }
        end 
    end

    private

    def like_params
        params.require(:like).permit(
            :likeable_type,
            :likeable_id
        )
    end
end
