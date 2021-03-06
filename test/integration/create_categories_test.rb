require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "pepito", email: "ex@example.com", password: "example", admin: true)
  end
  
  test "get new form and create category" do
    sign_in_as(@user, "example")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: {name: "games"}
    end
    assert_template 'categories/index'
    assert_match "games", response.body
  end
  
  test "invalid category submission" do
    sign_in_as(@user, "example")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: ""}
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end