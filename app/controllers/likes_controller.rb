class LikesController < ApplicationController
    def create
        like = Like.new(like_params)
        like.user_id = current_user.id

        if like.save
            post = Post.find_by(id: like.likeable_id)
            render json: PostSerializer.new(post).to_serialized_json
        else
            render json: { error: 'Something went wrong.' }
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
