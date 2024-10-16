require "test_helper"

class StoreReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_review = store_reviews(:one)
  end

  test "should get index" do
    get store_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_store_review_url
    assert_response :success
  end

  test "should create store_review" do
    assert_difference('StoreReview.count') do
      post store_reviews_url, params: { store_review: { category_id: @store_review.category_id, evaluation: @store_review.evaluation, group_id: @store_review.group_id, review: @store_review.review, review_image: @store_review.review_image, spot: @store_review.spot, tell: @store_review.tell, title: @store_review.title, user_id: @store_review.user_id } }
    end

    assert_redirected_to store_review_url(StoreReview.last)
  end

  test "should show store_review" do
    get store_review_url(@store_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_review_url(@store_review)
    assert_response :success
  end

  test "should update store_review" do
    patch store_review_url(@store_review), params: { store_review: { category_id: @store_review.category_id, evaluation: @store_review.evaluation, group_id: @store_review.group_id, review: @store_review.review, review_image: @store_review.review_image, spot: @store_review.spot, tell: @store_review.tell, title: @store_review.title, user_id: @store_review.user_id } }
    assert_redirected_to store_review_url(@store_review)
  end

  test "should destroy store_review" do
    assert_difference('StoreReview.count', -1) do
      delete store_review_url(@store_review)
    end

    assert_redirected_to store_reviews_url
  end
end
