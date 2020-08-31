# frozen_string_literal: true

require "application_system_test_case"

class ReportsTest < ApplicationSystemTestCase
  test "新しい日報を作成できる" do
    sign_in users(:one)
    visit new_report_path
    within "form[name=report]" do
      fill_in "タイトル", with: "新しい日報"
      fill_in "本文", with: "新しい日報を書きます。"
      click_on "登録する"
    end
    assert_text "日報が保存されました"
  end

  test "日報の一覧を表示できる" do
    visit reports_path
    assert_text reports(:one).title
  end

  test "日報の情報を更新できる" do
    sign_in users(:one)
    visit edit_report_path(reports(:one))
    within "form[name=report]" do
      fill_in "タイトル", with: "新しい日報"
      fill_in "本文", with: "新しい日報に更新。"
      click_on "更新する"
    end
    assert_text "日報が更新されました"
  end

  test "日報を削除できる" do
    sign_in users(:one)
    visit reports_path
    accept_confirm do
      click_on "削除"
    end
    assert_text "日報が削除されました"
  end
end
