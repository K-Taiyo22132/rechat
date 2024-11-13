require "application_system_test_case"

class ReviewHomesTest < ApplicationSystemTestCase
  setup do
    @review_home = review_homes(:one)
  end

  test "visiting the index" do
    visit review_homes_url
    assert_selector "h1", text: "Review Homes"
  end

  test "creating a Review home" do
    visit review_homes_url
    click_on "New Review Home"

    fill_in "Category", with: @review_home.category_id
    fill_in "Goods review", with: @review_home.goods_review_id
    fill_in "Group", with: @review_home.group_id
    fill_in "Store review", with: @review_home.store_review_id
    click_on "Create Review home"

    assert_text "Review home was successfully created"
    click_on "Back"
  end

  test "updating a Review home" do
    visit review_homes_url
    click_on "Edit", match: :first

    fill_in "Category", with: @review_home.category_id
    fill_in "Goods review", with: @review_home.goods_review_id
    fill_in "Group", with: @review_home.group_id
    fill_in "Store review", with: @review_home.store_review_id
    click_on "Update Review home"

    assert_text "Review home was successfully updated"
    click_on "Back"
  end

  test "destroying a Review home" do
    visit review_homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review home was successfully destroyed"
  end
end
