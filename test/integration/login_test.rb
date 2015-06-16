require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "successful login" do
    get login_path
    assert_select "input[type=password]", 1
    post login_path, name: "bob", password: "password", email: "bob@email.com"
    assert_redirected_to root_path
    follow_redirect!
    assert response.body.match("bob")
    

  end
end
