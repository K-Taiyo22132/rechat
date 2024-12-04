require "application_system_test_case"

class GroupReviewsTest < ApplicationSystemTestCase
  setup do
    @group_review = group_reviews(:one)
  end

  test "visiting the index" do
    visit group_reviews_url
    assert_selector "h1", text: "Group Reviews"
  end

  test "creating a Group review" do
    visit group_reviews_url
    click_on "New Group Review"

    fill_in "Category", with: @group_review.category_id
    fill_in "Goods review", with: @group_review.goods_review
    fill_in "Group", with: @group_review.group_id
    fill_in "Store review", with: @group_review.store_review_id
    fill_in "User", with: @group_review.user_id
    click_on "Create Group review"

    assert_text "Group review was successfully created"
    click_on "Back"
  end

  test "updating a Group review" do
    visit group_reviews_url
    click_on "Edit", match: :first

    fill_in "Category", with: @group_review.category_id
    fill_in "Goods review", with: @group_review.goods_review
    fill_in "Group", with: @group_review.group_id
    fill_in "Store review", with: @group_review.store_review_id
    fill_in "User", with: @group_review.user_id
    click_on "Update Group review"

    assert_text "Group review was successfully updated"
    click_on "Back"
  end

  test "destroying a Group review" do
    visit group_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group review was successfully destroyed"
  end
end
