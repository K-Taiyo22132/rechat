require "application_system_test_case"

class GoodsCommentsTest < ApplicationSystemTestCase
  setup do
    @goods_comment = goods_comments(:one)
  end

  test "visiting the index" do
    visit goods_comments_url
    assert_selector "h1", text: "Goods Comments"
  end

  test "creating a Goods comment" do
    visit goods_comments_url
    click_on "New Goods Comment"

    fill_in "Comment", with: @goods_comment.comment
    fill_in "Evaluation", with: @goods_comment.evaluation
    fill_in "Goods review", with: @goods_comment.goods_review_id
    fill_in "User", with: @goods_comment.user_id
    click_on "Create Goods comment"

    assert_text "Goods comment was successfully created"
    click_on "Back"
  end

  test "updating a Goods comment" do
    visit goods_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @goods_comment.comment
    fill_in "Evaluation", with: @goods_comment.evaluation
    fill_in "Goods review", with: @goods_comment.goods_review_id
    fill_in "User", with: @goods_comment.user_id
    click_on "Update Goods comment"

    assert_text "Goods comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Goods comment" do
    visit goods_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goods comment was successfully destroyed"
  end
end
