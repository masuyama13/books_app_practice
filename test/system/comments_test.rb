require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "本にコメントを投稿できる" do
    sign_in users(:one)
    visit book_path(books(:one))
    within "form#comment" do
      fill_in with: "本へのコメント。"
      click_on "登録する"
    end
    assert_text "本へのコメント。"
  end

  test "日報にコメントを投稿できる" do
    sign_in users(:one)
    visit report_path(reports(:one))
    within "form#comment" do
      fill_in with: "日報へのコメント。"
      click_on "登録する"
    end
    assert_text "日報へのコメント。"
  end
end
