require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end
  # # 1. Validar que la página de edición cargue correctamente.
  # test "should get edit page" do
  #   get edit_product_path(@product)
  #   assert_response :success
  # end

  #  # 2. Validar que la página muestre el título "Product Edition" con el formato h2.
  #   test "edit page should have title Product Edition in h2" do
  #    get edit_product_path(@product)
  #   assert_select "h2", "Product Edition"
  #   end

  # # 3. Validar que se muestre el mensaje "Product no registered" cuando el producto no exista.
  # test "should show Product no registered when product does not exist" do
  #   get edit_product_path(id: "non-existent")
  #   assert_response :not_found
  #   assert_match "Product no registered", response.body
  # end

  # 4. Validar que se inhabilite el botón para guardar los cambios si algún campo está en blanco.
  # test "save button should be disabled if fields are blank" do
  #   get edit_product_path(@product)
  #   assert_select "input[type=submit][disabled]", true
  # end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { description: @product.description, name: @product.name, price: @product.price } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, name: @product.name, price: @product.price } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
