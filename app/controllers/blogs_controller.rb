class BlogsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :authorize 

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    user = User.find_by(id: session[:user_id])
    blog = user.blogs.create!(blog_params)
    render json: blog, status: :created
  end

  def update
    blog = Blog.find_by(id: params[:id])
    if blog
      blog.update(blog_params)
      render json: blog
    else
      render json: { error: "Blog Not Found" } status: :not_found
    end
  end

  def destroy
    blog = Blog.find_by(id: params[:id])
    blog.destroy
    head :no_content
  end

  private

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def authorize
    return render json: { errors: ["Not Authorized"] }, status: :unauthorized unless session.include? :user_id
  end

  def blog_params
    params.permit(:title, :content, :published_on)
  end

end
