class ProductsController < ApplicationController

  def index
    @categories = Category.order(name: :asc)
    if params[:category_id] || params[:id]
      category_id = params[:category_id] || params[:id]
      @category = Category.find(category_id)
      products = @category.products.with_attached_photo.order(created_at: :desc)
    else
      products = Product.all.with_attached_photo.order(created_at: :desc)
    end
    render :index, locals: { products: products }
  end

  def show
    product
  end

  def new
    @product = Product.new
  end

  def edit
      product
  end

  def update
    if product.update(product_params)
      flash[:notice] = "Product updated successfully"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product created successfully"
        redirect_to products_path
      else
      render :new, status: :unprocessable_entity
      end
  end

  def destroy 
    product.destroy
    flash[:notice] = "Product deleted successfully"
    redirect_to products_path, status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo, :category_id)
  end

  def product
    @product ||= Product.find(params[:id])
  end

end
