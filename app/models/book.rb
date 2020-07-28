# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user

  def created_by?(user)
    return false if user == nil
    user_id == user.id
  end
end
