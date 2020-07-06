# frozen_string_literal: true

class AddProfilesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :zip, :string
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
