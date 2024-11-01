require "test_helper"

class GoodsCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goods_comment = goods_comments(:one)
  end

  test "should get index" do
    get goods_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_goods_comment_url
    assert_response :success
  end

  test "should create goods_comment" do
    assert_difference('GoodsComment.count') do
      post goods_comments_url, params: { goods_comment: { comment: @goods_comment.comment, evaluation: @goods_comment.evaluation, goods_review_id: @goods_comment.goods_review_id, user_id: @goods_comment.user_id } }
    end

    assert_redirected_to goods_comment_url(GoodsComment.last)
  end

  test "should show goods_comment" do
    get goods_comment_url(@goods_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_goods_comment_url(@goods_comment)
    assert_response :success
  end

  test "should update goods_comment" do
    patch goods_comment_url(@goods_comment), params: { goods_comment: { comment: @goods_comment.comment, evaluation: @goods_comment.evaluation, goods_review_id: @goods_comment.goods_review_id, user_id: @goods_comment.user_id } }
    assert_redirected_to goods_comment_url(@goods_comment)
  end

  test "should destroy goods_comment" do
    assert_difference('GoodsComment.count', -1) do
      delete goods_comment_url(@goods_comment)
    end

    assert_redirected_to goods_comments_url
  end
end
