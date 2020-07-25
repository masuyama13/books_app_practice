# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  def created_by?(user)
    user_id == user.id ? true : false
  end
end
