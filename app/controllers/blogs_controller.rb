class BlogsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

  def index
    @blogs = Blog.all
  end

  # def show

  # end

  def create
    user = User.find_by(id: session[:user_id])
    blog = user.blogs.create!(blog_params)
    render json: blog, status: :created
  end

  # def update
    
  # end

  def destroy
    blog = Blog.find_by(id: params[:id])
    blog.destroy
    head :no_content
  end

  private

  def render_unprocessable_entity(invalid)
      render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def blog_params
      params.permit(:content)
  end

end
