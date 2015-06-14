require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = Author.create!(name: "John", email: "john@email.com", password: "password")
    session[:user_id] = @author.id
  end

  test "should get show" do
    get :show, id: @author
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @author
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create author" do
    assert_difference('Author.count') do
      post :create, author: { email: @author.email, name: @author.name, password: "password" }
    end

    assert_redirected_to surveys_url
  end

  test "should update author" do
    patch :update, id: @author, author: { email: @author.email, name: @author.name }
    assert_redirected_to surveys_url
  end

end
