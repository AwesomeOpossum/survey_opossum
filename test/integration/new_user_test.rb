require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "create new user" do
    #go to log in page
    get login_path
    assert_select "input[type='password']", 1

    #go to new author path
    get new_author_path
    # we are taken to new_author_path
    assert_redirected_to new_author_path

    #go to the page where we are redirected to
    follow_redirect!
    # page displays two password fields
    assert_select "input[type='password']", 2

    #we create a new author
    post new_author_path, author: {name: "John", email: "john@email.com",
        password:"password", password_confirmation: "password" }
    assert_redirected_to root_path

    follow_redirect!
    assert response.body.match("John")
    # check that number of surveys is zero
    assert_equal 0, css_select("tbody tr").count

    # it displays a logout link
    assert_select "a[href='#{logout_path}']"

    # we log out
    get sessions_logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_select "input[type='password']"
    assert response.body.match("Logout successful.")
  end
end
