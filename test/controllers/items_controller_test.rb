require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should destroy item" do
    assert_difference("Item.count", -1) do
      delete item_url(@item)
    end

    assert_redirected_to root_path
  end

  test "should update item name" do
    patch item_url(@item), params: { item: { name: "updated", quantity:@item.quantity, location:@item.location.id } }

    assert_redirected_to root_path 
    # Reload association to fetch updated data and assert that name is updated.
    @item.reload
    assert_equal "updated", @item.name
  end

  test "should update item quantity" do
    patch item_url(@item), params: { item: { name: @item.name, quantity: 99, location:@item.location.id } }

    assert_redirected_to root_path 
    # Reload association to fetch updated data and assert that name is updated.
    @item.reload
    assert_equal 99, @item.quantity
  end

  test "should update item location" do
    patch item_url(@item), params: { item: { name: @item.name, quantity:@item.quantity, location: locations(:two).id } }

    assert_redirected_to root_path
    @item.reload
    assert_equal locations(:two), @item.location
  end
end
