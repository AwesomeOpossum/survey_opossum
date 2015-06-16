require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test "successful login" do
    get login_path

    assert_select "input[type='password']", 1
    post login_path, email: "bob@email.com", password: "password"
    assert_redirected_to root_path

    follow_redirect!
    assert response.body.match("bob")
    number_of_surveys = css_select("tbody tr").count

    get new_survey_path
    assert_response :success
    post surveys_path, survey: {title: "Test Survey" }
    assert_redirected_to root_path

    follow_redirect!
    assert response.body.match("bob")
    assert response.body.match("Test Survey")
    assert_equal number_of_surveys+1, css_select("tbody tr").count

    assert_select "a[href='#{logout_path}']"

    get sessions_logout_path
    assert_redirected_to login_path
    follow_redirect!
    assert_select "input[type='password']"
    assert response.body.match("Logout successful.")
  end
end
