require 'test_helper'

class NewUserTest < ActionDispatch::IntegrationTest
  test "create new user" do
    get login_path
    assert_select "input[type='password']", 1
    get new_author_path
    assert_select "input[type='password']", 2

    post authors_path, author: {name: "John", email: "john@email.com",
        password:"password", password_confirmation: "password" }
    assert_redirected_to root_path

    follow_redirect!
    assert response.body.match("John")
    assert_equal 0, css_select("tbody tr").count

    assert_select "a[href='#{logout_path}']"

    get sessions_logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_select "input[type='password']"
    assert response.body.match("Logout successful.")
  end
end
