class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all.includes(:friends, :posts, :likes, :comments)
        render json: UserSerializer.new(users).to_serialized_json
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        user = User.create(user_params)

        if user.valid?
            user.update(username: user_params[:email].split("@")[0])
            
            token = encode_token(user_id: user.id)
            render json: { user: UserSerializer.new(user), jwt: token }, status: :created
        else
            render json: { error: 'Failed to create user.' }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password
        )
    end
end
