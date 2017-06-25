# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  username        :string
#  name            :string
#  last_name       :string
#  address         :string
#  phone_number    :string
#  is_admin        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  avatar          :string
#  token           :string
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_token     (token) UNIQUE
#  index_users_on_username  (username) UNIQUE
#

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { address: @user.address, email: @user.email, is_admin: @user.is_admin, last_name: @user.last_name, name: @user.name, phone_number: @user.phone_number, username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { address: @user.address, email: @user.email, is_admin: @user.is_admin, last_name: @user.last_name, name: @user.name, phone_number: @user.phone_number, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
