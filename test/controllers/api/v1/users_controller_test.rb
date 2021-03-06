require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :one
  end

  test 'should show a user' do
    get api_v1_user_url @user, as: :json

    assert_response :success # 200

    json_response = JSON.parse response.body
    assert_equal @user.email, json_response['email']
  end

  test 'should create a user' do
    assert_difference 'User.count' do
      post api_v1_users_url, params: { user: { email: '@', password: :foo } }, as: :json
    end

    assert_response :created # 201
  end

  test 'should not create a user with a taken email' do
    assert_no_difference 'User.count' do
      post api_v1_users_url, params: { user: { email: @user.email, password: :foo } }, as: :json
    end

    assert_response :unprocessable_entity # 422
  end

  test 'user should be able to update itself' do
    skip
  end

  test 'user should not be able to update another user' do
    skip
  end

  test 'should destroy a user' do
    assert_difference 'User.count', -1 do
      delete api_v1_user_url @user, as: :json
    end

    assert :no_content
  end
end
