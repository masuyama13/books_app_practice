# frozen_string_literal: true

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "新しいユーザーを登録" do
    visit new_user_registration_path
    within "form[name=user_registration]" do
      fill_in "Eメール", with: "xxx@example.com"
      fill_in "ユーザー名", with: "hoge"
      fill_in "郵便番号", with: "123-4567"
      fill_in "住所", with: "Japan"
      fill_in "自己紹介", with: "自己紹介です。"
      fill_in "パスワード", with: "123456"
      fill_in "パスワード（確認用）", with: "123456"
      click_on "アカウント登録"
    end
    assert_text "アカウント登録が完了しました。"
  end

  test "ユーザープロフィールを表示" do
    sign_in users(:one)
    visit user_path(users(:two))
    assert_text users(:two).name
  end

  test "ユーザー情報を更新" do
    sign_in users(:one)
    visit edit_user_registration_path(users(:one))
    within "form[name=user_edit]" do
      fill_in "ユーザー名", with: "新しい名前"
      click_on "更新"
    end
    assert_text "アカウント情報を変更しました"
  end

  test "ユーザーを削除" do
    sign_in users(:one)
    visit edit_user_registration_path(users(:one))
    accept_confirm do
      click_on "アカウント削除"
    end
    assert_text "アカウントを削除しました。またのご利用をお待ちしております。"
  end
end
