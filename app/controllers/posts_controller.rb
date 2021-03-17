class PostsController < ApplicationController
    def index
        posts = Post.all.order(id: :desc)
        render json: PostSerializer.new(posts).to_serialized_json
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id

        if post.save
            render json: PostSerializer.new(post).to_serialized_json
        else
            render json: { error: 'Unable to save post.' }
        end
    end

    private

    def post_params
        params.require(:post).permit(
            :title,
            :content
        )
    end
end
