require "application_system_test_case"

class SelectCategoriesTest < ApplicationSystemTestCase
  setup do
    @select_category = select_categories(:one)
  end

  test "visiting the index" do
    visit select_categories_url
    assert_selector "h1", text: "Select Categories"
  end

  test "creating a Select category" do
    visit select_categories_url
    click_on "New Select Category"

    fill_in "Category", with: @select_category.category_id
    fill_in "User", with: @select_category.user_id
    click_on "Create Select category"

    assert_text "Select category was successfully created"
    click_on "Back"
  end

  test "updating a Select category" do
    visit select_categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: @select_category.category_id
    fill_in "User", with: @select_category.user_id
    click_on "Update Select category"

    assert_text "Select category was successfully updated"
    click_on "Back"
  end

  test "destroying a Select category" do
    visit select_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Select category was successfully destroyed"
  end
end
