# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = @commentable.comments.new
  end

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: t("flash.create", model: @comment.model_name.human)
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
