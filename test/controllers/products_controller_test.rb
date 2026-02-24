require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    get products_path
    assert_response :success
    assert_select '.product'
  end

  test 'render a specific product' do
    get product_path(products(:one))
    assert_response :success
    assert_select '.title', 'PS4'
    assert_select '.description', 'Great console'
  end

  test 'render new product form' do
    get new_product_path
    assert_response :success
    assert_select 'form'
  end

  test 'create a new product' do
    post products_path, params: { product: { title: 'New Product', description: 'New product description', price: 199.99, category_id: categories(:one).id } }
    assert_response :redirect
  end

  test 'allows to update a product' do
    patch product_path(products(:one)), params: {
      product: {
        price: 149.99,
        category_id: categories(:one).id
      }
    }
    assert_redirected_to products_path
    assert_equal flash[:notice], "Product updated successfully"
  end

  test 'allows to delete a product' do
    delete product_path(products(:one))
    assert_redirected_to products_path
    assert_equal flash[:notice], "Product deleted successfully"
  end

end
