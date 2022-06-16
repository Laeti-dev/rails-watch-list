require "application_system_test_case"

class ListsTest < ApplicationSystemTestCase
  test "visiting the index" do
    #exercice
    visit root_url
    #verify
    assert_selector "h1", text: "Let's watch something"
  end

  test "create a new list" do
    visit "/lists/new"

    fill_in "list_name", with: "User"

    click_on "Create"

    # should be redirect to Home with new product
    assert_equal root_path, page.current_path
    assert_text "User"
  end

  test "update a list"
end
