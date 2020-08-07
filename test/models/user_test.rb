# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "GitHub認証時に登録済みユーザーであればそのユーザーを返せる" do
    auth = OmniAuth::AuthHash.new({
      uid: "002",
      provider: "github",
    })
    auth_user = User.from_omniauth(auth)
    assert_equal users(:two), auth_user
  end

  test "GitHub認証時に未登録ユーザーであれば新規登録できる" do
    auth = OmniAuth::AuthHash.new({
      uid: "999",
      provider: "github",
      info: {
        name: "Chris"
      }
    })
    auth_user = User.from_omniauth(auth)
    assert auth_user
  end

  test "パスワードなしでユーザー情報を更新できる" do
    users(:one).update_without_current_password(profile: "ありすです。")
    assert_equal "ありすです。", users(:one).profile
  end

  test "ユーザーをフォローできる" do
    users(:one).follow(users(:two))
    assert users(:one).following?(users(:two))
  end

  test "ユーザーをフォロー解除できる" do
    users(:one).follow(users(:two))
    users(:one).unfollow(users(:two))
    assert_not users(:one).following?(users(:two))
  end
end
