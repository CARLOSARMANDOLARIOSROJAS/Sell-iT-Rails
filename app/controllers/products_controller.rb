class ProductsController < ApplicationController

  def index
    products = Product.all
    render :index, locals: { products: products }
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Producto actualizado correctamente"
      redirect_to products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Producto creado correctamente"
        redirect_to products_path
      else
      render :new, status: :unprocessable_entity
      end
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other
    flash[:notice] = "Producto eliminado correctamente"
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :photo)
  end
end
