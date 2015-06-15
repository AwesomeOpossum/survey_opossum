require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  setup do
    @author = Author.create!(name: "Zack", email: "zack@email.com", password: "password")
  end

  test "should be valid" do
    assert @author.valid?
  end

  test "author should have name" do
    author = Author.new(email: "zack@email.com", password: "password")
    refute author.save
  end

  test "author should have email" do
    author = Author.new(name: "zack", password: "password")
    refute author.save
  end

  test "author should have password" do
    author = Author.new(name: "zack", email: "zack@email.com")
    refute author.save
  end





end
