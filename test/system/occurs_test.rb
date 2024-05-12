require "application_system_test_case"

class OccursTest < ApplicationSystemTestCase
  setup do
    @occur = occurs(:one)
  end

  test "visiting the index" do
    visit occurs_url
    assert_selector "h1", text: "Occurs"
  end

  test "should create occur" do
    visit occurs_url
    click_on "New occur"

    fill_in "Error", with: @occur.error_id
    fill_in "User", with: @occur.user_id
    click_on "Create Occur"

    assert_text "Occur was successfully created"
    click_on "Back"
  end

  test "should update Occur" do
    visit occur_url(@occur)
    click_on "Edit this occur", match: :first

    fill_in "Error", with: @occur.error_id
    fill_in "User", with: @occur.user_id
    click_on "Update Occur"

    assert_text "Occur was successfully updated"
    click_on "Back"
  end

  test "should destroy Occur" do
    visit occur_url(@occur)
    click_on "Destroy this occur", match: :first

    assert_text "Occur was successfully destroyed"
  end
end
