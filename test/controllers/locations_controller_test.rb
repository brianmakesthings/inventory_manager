require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should destroy location" do
    assert_difference("Location.count", -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_path
  end

  test "should destroy corresponding items" do
    delete location_url(@location)
    assert_raise(Exception) {items(:one)}

    assert_redirected_to locations_path
  end

  test "should update location" do
    patch location_url(@location), params: { location: { name: "updated" } }

    assert_redirected_to locations_path
    # Reload association to fetch updated data and assert that name is updated.
    @location.reload
    assert_equal "updated", @location.name
  end
end
