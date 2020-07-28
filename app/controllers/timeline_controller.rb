# frozen_string_literal: true

class TimelineController < ApplicationController
  def index
    @books = Book.where(user_id: current_user.following).page(params[:page])
  end
end
