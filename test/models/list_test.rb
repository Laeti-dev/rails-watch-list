require "test_helper"

class ListsTest < ActiveSupport::TestCase
  test "should not save a list without a name" do
    list = List.new
    assert_not list.save, "Saved the list without a name"
  end
end
