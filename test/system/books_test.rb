# frozen_string_literal: true

require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "新しい本を作成できる" do
    sign_in users(:one)
    visit new_book_path
    within "form[name=book]" do
      fill_in "タイトル", with: "新しい本"
      fill_in "メモ", with: "新しい本のメモ。"
      fill_in "著者", with: "著者名"
      click_on "登録する"
    end
    assert_text "本が保存されました"
  end

  test "本の一覧を表示できる" do
    visit books_path
    assert_text books(:one).title
  end

  test "本の情報を更新できる" do
    sign_in users(:one)
    visit edit_book_path(books(:one))
    within "form[name=book]" do
      fill_in "タイトル", with: "新しい本"
      fill_in "メモ", with: "新しい本に更新。"
      fill_in "著者", with: "著者名"
      click_on "更新する"
    end
    assert_text "本が更新されました"
  end

  test "本を削除できる" do
    sign_in users(:one)
    visit books_path
    accept_confirm do
      click_on "削除"
    end
    assert_text "本が削除されました"
  end
end
