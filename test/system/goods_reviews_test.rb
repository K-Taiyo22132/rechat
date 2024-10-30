require "application_system_test_case"

class GoodsReviewsTest < ApplicationSystemTestCase
  setup do
    @goods_review = goods_reviews(:one)
  end

  test "visiting the index" do
    visit goods_reviews_url
    assert_selector "h1", text: "Goods Reviews"
  end

  test "creating a Goods review" do
    visit goods_reviews_url
    click_on "New Goods Review"

    fill_in "Category", with: @goods_review.category_id
    fill_in "Evaluation", with: @goods_review.evaluation
    fill_in "Group", with: @goods_review.group_id
    fill_in "Price", with: @goods_review.price
    fill_in "Review", with: @goods_review.review
    fill_in "Review image", with: @goods_review.review_image
    fill_in "Title", with: @goods_review.title
    fill_in "User", with: @goods_review.user_id
    click_on "Create Goods review"

    assert_text "Goods review was successfully created"
    click_on "Back"
  end

  test "updating a Goods review" do
    visit goods_reviews_url
    click_on "Edit", match: :first

    fill_in "Category", with: @goods_review.category_id
    fill_in "Evaluation", with: @goods_review.evaluation
    fill_in "Group", with: @goods_review.group_id
    fill_in "Price", with: @goods_review.price
    fill_in "Review", with: @goods_review.review
    fill_in "Review image", with: @goods_review.review_image
    fill_in "Title", with: @goods_review.title
    fill_in "User", with: @goods_review.user_id
    click_on "Update Goods review"

    assert_text "Goods review was successfully updated"
    click_on "Back"
  end

  test "destroying a Goods review" do
    visit goods_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goods review was successfully destroyed"
  end
end
