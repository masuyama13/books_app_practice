# frozen_string_literal: true

class ChangeColumnNullOnComments < ActiveRecord::Migration[6.0]
  def change
    change_column_null :comments, :body, false
  end
end
