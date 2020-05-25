require 'test_helper'



class CategoryTest < ActiveSupport::TestCase

  def setup
  @category = Category.new(name: "Sports")
  end

  test "Category should be valid" do
    assert @category.valid?
  end

  test "is the name the same" do
    @category.save
    @category2 = Category.new(name: "Sports")
    assert_not @category2.valid?
  end

  test "is the name blank string" do
    @category.name =" "
    assert_not @category.valid?
  end

  test "is the name too long" do
    @category.name ="a" * 26
    assert_not @category.valid?
  end

  test "is the name too short" do
    @category.name ="aa"
    assert_not @category.valid?
  end

end
