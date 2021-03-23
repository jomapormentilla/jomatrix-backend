class PostsController < ApplicationController
    def index
        if params[:page]
            page = params[:page]
            posts = Post.all.order(id: :desc).with_attached_image.includes(:comments, :likes).limit(10).offset(10*page.to_i)
        else
            posts = Post.all.order(id: :desc).with_attached_image.includes(:comments, :likes)
        end

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

    def destroy
        post = Post.find_by(id: params[:id])

        if !!post
            post.delete
            render json: PostSerializer.new(post).to_serialized_json
        else
            render json: { error: 'Unable to delete post.' }
        end
    end

    private

    def post_params
        params.require(:post).permit(
            :title,
            :content,
            :location
        )
    end
end
