require "application_system_test_case"

class StoreReviewsTest < ApplicationSystemTestCase
  setup do
    @store_review = store_reviews(:one)
  end

  test "visiting the index" do
    visit store_reviews_url
    assert_selector "h1", text: "Store Reviews"
  end

  test "creating a Store review" do
    visit store_reviews_url
    click_on "New Store Review"

    fill_in "Category", with: @store_review.category_id
    fill_in "Evaluation", with: @store_review.evaluation
    fill_in "Group", with: @store_review.group_id
    fill_in "Review", with: @store_review.review
    fill_in "Review image", with: @store_review.review_image
    fill_in "Spot", with: @store_review.spot
    fill_in "Tell", with: @store_review.tell
    fill_in "Title", with: @store_review.title
    fill_in "User", with: @store_review.user_id
    click_on "Create Store review"

    assert_text "Store review was successfully created"
    click_on "Back"
  end

  test "updating a Store review" do
    visit store_reviews_url
    click_on "Edit", match: :first

    fill_in "Category", with: @store_review.category_id
    fill_in "Evaluation", with: @store_review.evaluation
    fill_in "Group", with: @store_review.group_id
    fill_in "Review", with: @store_review.review
    fill_in "Review image", with: @store_review.review_image
    fill_in "Spot", with: @store_review.spot
    fill_in "Tell", with: @store_review.tell
    fill_in "Title", with: @store_review.title
    fill_in "User", with: @store_review.user_id
    click_on "Update Store review"

    assert_text "Store review was successfully updated"
    click_on "Back"
  end

  test "destroying a Store review" do
    visit store_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store review was successfully destroyed"
  end
end
