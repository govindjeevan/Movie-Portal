require "application_system_test_case"

class RolePermissionsTest < ApplicationSystemTestCase
  setup do
    @role_permission = role_permissions(:one)
  end

  test "visiting the index" do
    visit role_permissions_url
    assert_selector "h1", text: "Role Permissions"
  end

  test "creating a Role permission" do
    visit role_permissions_url
    click_on "New Role Permission"

    fill_in "Permission", with: @role_permission.permission_id
    fill_in "Role", with: @role_permission.role_id
    click_on "Create Role permission"

    assert_text "Role permission was successfully created"
    click_on "Back"
  end

  test "updating a Role permission" do
    visit role_permissions_url
    click_on "Edit", match: :first

    fill_in "Permission", with: @role_permission.permission_id
    fill_in "Role", with: @role_permission.role_id
    click_on "Update Role permission"

    assert_text "Role permission was successfully updated"
    click_on "Back"
  end

  test "destroying a Role permission" do
    visit role_permissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Role permission was successfully destroyed"
  end
end
