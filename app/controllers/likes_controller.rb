# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable, only: %i[show create destroy]

  def show
    @like = @likeable.likes.find_by!(user: current_user)
  end

  def create
    @like = @likeable.likes.find_or_initialize_by(user: current_user)

    respond_to do |format|
      if @like.save
        format.json_api_v1 { render :show, status: :created }
      else
        format.json_api_v1 { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @like = @likeable.likes.find_by!(user: current_user)
    @like.destroy

    respond_to do |format|
      format.json_api_v1 { head :no_content }
    end
  end

  private

  def set_likeable
    @likeable = Post.find(params[:post_id])
  end
end
