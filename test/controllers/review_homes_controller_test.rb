require "test_helper"

class ReviewHomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review_home = review_homes(:one)
  end

  test "should get index" do
    get review_homes_url
    assert_response :success
  end

  test "should get new" do
    get new_review_home_url
    assert_response :success
  end

  test "should create review_home" do
    assert_difference('ReviewHome.count') do
      post review_homes_url, params: { review_home: { category_id: @review_home.category_id, goods_review_id: @review_home.goods_review_id, group_id: @review_home.group_id, store_review_id: @review_home.store_review_id } }
    end

    assert_redirected_to review_home_url(ReviewHome.last)
  end

  test "should show review_home" do
    get review_home_url(@review_home)
    assert_response :success
  end

  test "should get edit" do
    get edit_review_home_url(@review_home)
    assert_response :success
  end

  test "should update review_home" do
    patch review_home_url(@review_home), params: { review_home: { category_id: @review_home.category_id, goods_review_id: @review_home.goods_review_id, group_id: @review_home.group_id, store_review_id: @review_home.store_review_id } }
    assert_redirected_to review_home_url(@review_home)
  end

  test "should destroy review_home" do
    assert_difference('ReviewHome.count', -1) do
      delete review_home_url(@review_home)
    end

    assert_redirected_to review_homes_url
  end
end
