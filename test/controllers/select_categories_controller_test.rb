require "test_helper"

class SelectCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @select_category = select_categories(:one)
  end

  test "should get index" do
    get select_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_select_category_url
    assert_response :success
  end

  test "should create select_category" do
    assert_difference('SelectCategory.count') do
      post select_categories_url, params: { select_category: { category_id: @select_category.category_id, user_id: @select_category.user_id } }
    end

    assert_redirected_to select_category_url(SelectCategory.last)
  end

  test "should show select_category" do
    get select_category_url(@select_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_select_category_url(@select_category)
    assert_response :success
  end

  test "should update select_category" do
    patch select_category_url(@select_category), params: { select_category: { category_id: @select_category.category_id, user_id: @select_category.user_id } }
    assert_redirected_to select_category_url(@select_category)
  end

  test "should destroy select_category" do
    assert_difference('SelectCategory.count', -1) do
      delete select_category_url(@select_category)
    end

    assert_redirected_to select_categories_url
  end
end
