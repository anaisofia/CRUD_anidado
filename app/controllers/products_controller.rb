class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to category_products_path
    else
      @category = @product.category
      render "categories/show"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to category_path(@product.category)
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
