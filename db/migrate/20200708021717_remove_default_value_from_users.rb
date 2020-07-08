# frozen_string_literal: true

class RemoveDefaultValueFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :email, from: "", to: nil
    change_column_default :users, :encrypted_password, from: "", to: nil
  end
end
