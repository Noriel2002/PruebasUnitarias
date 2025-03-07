# require "test_helper"

# class ProductTest < ActiveSupport::TestCase
#   test "the truth" do
#     assert true
#   end
# end
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product1 = Product.create(name: "Product 1", price: 100, created_at: Time.zone.now)
    @product2 = Product.create(name: "Product 2", price: 600, created_at: Time.zone.now - 1.day)
    @product3 = Product.create(name: "Product 3", price: 300, created_at: Time.zone.now - 2.days)
  end

  test "should search products by name" do
    assert_includes Product.search("product 1"), @product1
    assert_not_includes Product.search("product 1"), @product2
  end

  test "should return products with price less than 500" do
    assert_includes Product.minor, @product1
    assert_not_includes Product.minor, @product2
  end

  test "should return products with price greater than 500" do
    assert_includes Product.major, @product2
    assert_not_includes Product.major, @product1
  end

  test "should return recently added products" do
    assert_equal [@product1, @product2, @product3], Product.recent
  end

  test "should filter products by price range" do
    assert_includes Product.by_price_range(100, 300), @product1
    assert_includes Product.by_price_range(100, 300), @product3
    assert_not_includes Product.by_price_range(100, 300), @product2
  end

  test "should order products by price ascending" do
    assert_equal [@product1, @product3, @product2], Product.cheap_first
  end

  test "should order products by price descending" do
    assert_equal [@product2, @product3, @product1], Product.expensive_first
  end

  test "should return products created today" do
    assert_includes Product.today, @product1
    assert_not_includes Product.today, @product2
  end
end