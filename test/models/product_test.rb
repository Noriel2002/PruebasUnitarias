require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product1 = Product.create!(name: "Product 1", price: 100, created_at: Time.zone.now)
    @product2 = Product.create!(name: "Product 2", price: 600, created_at: 1.day.ago)
    @product3 = Product.create!(name: "Product 3", price: 300, created_at: 2.days.ago)
  end

  test "should search products by name" do
    assert_includes Product.search("Product 1"), @product1
    assert_not_includes Product.search("Product 1"), @product2
  end

  test "should return products with price less than 500" do
    assert_includes Product.minor, @product1
    assert_includes Product.minor, @product3
    assert_not_includes Product.minor, @product2
  end

  test "should return products with price greater than or equal to 500" do
    assert_includes Product.major, @product2
    assert_not_includes Product.major, @product1
  end

  test "should filter products by price range" do
    results = Product.by_price_range(100, 300)
    assert_includes results, @product1
    assert_includes results, @product3
    assert_not_includes results, @product2
  end

  test "should return products created today" do
    assert_includes Product.today, @product1
    assert_not_includes Product.today, @product2
  end
end
