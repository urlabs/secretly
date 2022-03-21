# frozen_string_literal: true

class PostsController < ApiController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.json_api_v1 { render :show, status: :created }
      else
        format.json_api_v1 { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json_api_v1 { render :show, status: :ok }
      else
        format.json_api_v1 { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.json_api_v1 { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :latitude, :longitude)
  end
end
