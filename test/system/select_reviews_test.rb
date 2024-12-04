require "application_system_test_case"

class SelectReviewsTest < ApplicationSystemTestCase
  setup do
    @select_review = select_reviews(:one)
  end

  test "visiting the index" do
    visit select_reviews_url
    assert_selector "h1", text: "Select Reviews"
  end

  test "creating a Select review" do
    visit select_reviews_url
    click_on "New Select Review"

    fill_in "Goods review", with: @select_review.goods_review_id
    fill_in "Store review", with: @select_review.store_review_id
    click_on "Create Select review"

    assert_text "Select review was successfully created"
    click_on "Back"
  end

  test "updating a Select review" do
    visit select_reviews_url
    click_on "Edit", match: :first

    fill_in "Goods review", with: @select_review.goods_review_id
    fill_in "Store review", with: @select_review.store_review_id
    click_on "Update Select review"

    assert_text "Select review was successfully updated"
    click_on "Back"
  end

  test "destroying a Select review" do
    visit select_reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Select review was successfully destroyed"
  end
end
