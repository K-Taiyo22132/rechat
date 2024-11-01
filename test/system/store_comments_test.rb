require "application_system_test_case"

class StoreCommentsTest < ApplicationSystemTestCase
  setup do
    @store_comment = store_comments(:one)
  end

  test "visiting the index" do
    visit store_comments_url
    assert_selector "h1", text: "Store Comments"
  end

  test "creating a Store comment" do
    visit store_comments_url
    click_on "New Store Comment"

    fill_in "Comment", with: @store_comment.comment
    fill_in "Store review", with: @store_comment.store_review_id
    fill_in "User", with: @store_comment.user_id
    click_on "Create Store comment"

    assert_text "Store comment was successfully created"
    click_on "Back"
  end

  test "updating a Store comment" do
    visit store_comments_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @store_comment.comment
    fill_in "Store review", with: @store_comment.store_review_id
    fill_in "User", with: @store_comment.user_id
    click_on "Update Store comment"

    assert_text "Store comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Store comment" do
    visit store_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store comment was successfully destroyed"
  end
end
