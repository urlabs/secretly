# frozen_string_literal: true

module Api
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comentable
    before_action :set_comment, only: %i[show update destroy]

    def index
      @comment = @comentable.comments
    end

    def show; end

    def create
      @comment = @comentable.comments.build(comment_params)
      @comment.user = current_user

      respond_to do |format|
        if @comment.save
          format.json_api_v1 { render :show, status: :created }
        else
          format.json_api_v1 { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.json_api_v1 { render :show, status: :created }
        else
          format.json_api_v1 { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @comment.destroy

      respond_to do |format|
        format.json_api_v1 { head :no_content }
      end
    end

    private

    def set_comentable
      @comentable = Post.find(params[:post_id])
    end

    def set_comment
      @comment = @comentable.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
  end
end
