class CommentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    # def index

    # end

    # def show

    # end

    def create
        user = User.find_by(id: session[:user_id])
        comment = user.comments.create!(comment_params)
        render json: comment, status: :created
    end

    # def update

    # end

    def destroy 
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        head :no_content
    end

    private

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def comment_params
        params.permit(:content)
    end

end
