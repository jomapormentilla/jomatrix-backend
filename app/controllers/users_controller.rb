class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def index
        users = User.all.includes(:friends, :posts, :likes, :comments)
        render json: UserSerializer.new(users).to_serialized_json
    end

    def profile
        render json: UserSerializer.new(current_user).to_serialized_json
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

    def update
        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { error: 'Unable to update the user.' }
        end
    end

    def update_password
        user = User.find_by(id: params[:id])

        if !!params[:old_password] && user.authenticate(params[:old_password])
            user.update(user_params)
            render json: UserSerializer.new(user).to_serialized_json
        else
            render json: { error: 'Unable to update password.' }
        end
    end

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :username,
            :website,
            :bio,
            :gender,
            :image,
            :old_password
        )
    end
end
