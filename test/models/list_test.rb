require "test_helper"

class ListsTest < ActiveSupport::TestCase
  test "should not save a list without a name" do
    list = List.new
    list.save
    list.invalid?
    assert_not list.errors[:name].empty?
  end
end
