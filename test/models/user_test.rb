require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with valid email should pass' do
    user = User.new email: 'user@user.com', password: :rapsberry

    assert user.valid?
  end

  test 'user with no email should not pass' do
    user = User.new password: :raspberry

    assert_not user.valid?
  end

  test 'user with no password should not pass' do
    user = User.new email: 'user@user.com'

    assert_not user.valid?
  end

  test 'user with passwords mismatch should not pass' do
    user = User.new email: 'user@user.com', password: :raspberry, password_confirmation: :foo

    assert_not user.valid?
  end

  test 'user with unvalid email should not pass' do
    user = User.new email: :foo, password: :rapsberry

    assert_not user.valid?
  end

  test 'user with taken email should not pass' do
    other_user = users :one

    user = User.new email: other_user.email, password: :rapsberry

    assert_not user.valid?
  end
end
