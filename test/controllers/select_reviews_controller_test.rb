require "test_helper"

class SelectReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @select_review = select_reviews(:one)
  end

  test "should get index" do
    get select_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_select_review_url
    assert_response :success
  end

  test "should create select_review" do
    assert_difference('SelectReview.count') do
      post select_reviews_url, params: { select_review: { goods_review_id: @select_review.goods_review_id, store_review_id: @select_review.store_review_id } }
    end

    assert_redirected_to select_review_url(SelectReview.last)
  end

  test "should show select_review" do
    get select_review_url(@select_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_select_review_url(@select_review)
    assert_response :success
  end

  test "should update select_review" do
    patch select_review_url(@select_review), params: { select_review: { goods_review_id: @select_review.goods_review_id, store_review_id: @select_review.store_review_id } }
    assert_redirected_to select_review_url(@select_review)
  end

  test "should destroy select_review" do
    assert_difference('SelectReview.count', -1) do
      delete select_review_url(@select_review)
    end

    assert_redirected_to select_reviews_url
  end
end
