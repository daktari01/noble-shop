class ProductsController < ApplicationController
  before_action :set_category, except: %i[all_products]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET categories/1/products
  def index
    @products = @category.products
  end

  # GET categories/1/products/1
  def show
  end

  # GET categories/1/products/new
  def new
    @product = @category.products.build
  end

  # GET categories/1/products/1/edit
  def edit
  end

  # POST categories/1/products
  def create
    # binding.pry
    @product = @category.products.build(product_params)
    subtypes = ''
    params[:subtypes].each {|k, v| subtypes << "#{k}: #{v}, "}
    @product.subtype = subtypes.strip.chop
    if @product.save
      redirect_to([@product.category, @product], notice: 'Product was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT categories/1/products/1
  def update
    if @product.update_attributes(product_params)
      redirect_to([@product.category, @product], notice: 'Product was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE categories/1/products/1
  def destroy
    @product.destroy

    redirect_to category_products_url(@category)
  end

  def all_products
    @all_products = Product.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_product
      @product = @category.products.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:subtype, :price, :quantity, :category_id)
    end
end
