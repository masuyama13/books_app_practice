# frozen_string_literal: true

class AddUserIdToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :user, foreign_key: true
    change_column :books, :user_id, :integer, null: false
  end
end
