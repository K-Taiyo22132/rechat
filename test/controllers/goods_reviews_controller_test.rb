require "test_helper"

class GoodsReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goods_review = goods_reviews(:one)
  end

  test "should get index" do
    get goods_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_goods_review_url
    assert_response :success
  end

  test "should create goods_review" do
    assert_difference('GoodsReview.count') do
      post goods_reviews_url, params: { goods_review: { category_id: @goods_review.category_id, evaluation: @goods_review.evaluation, group_id: @goods_review.group_id, price: @goods_review.price, review: @goods_review.review, review_image: @goods_review.review_image, title: @goods_review.title, user_id: @goods_review.user_id } }
    end

    assert_redirected_to goods_review_url(GoodsReview.last)
  end

  test "should show goods_review" do
    get goods_review_url(@goods_review)
    assert_response :success
  end

  test "should get edit" do
    get edit_goods_review_url(@goods_review)
    assert_response :success
  end

  test "should update goods_review" do
    patch goods_review_url(@goods_review), params: { goods_review: { category_id: @goods_review.category_id, evaluation: @goods_review.evaluation, group_id: @goods_review.group_id, price: @goods_review.price, review: @goods_review.review, review_image: @goods_review.review_image, title: @goods_review.title, user_id: @goods_review.user_id } }
    assert_redirected_to goods_review_url(@goods_review)
  end

  test "should destroy goods_review" do
    assert_difference('GoodsReview.count', -1) do
      delete goods_review_url(@goods_review)
    end

    assert_redirected_to goods_reviews_url
  end
end
