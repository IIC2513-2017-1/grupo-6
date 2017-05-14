class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticated_admin?, only:[:create, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

    # Mas adelante se restringira a que solo el admin pueda crear y editar productos, asique no tiene mucho sentido validar estas acciones
    # (se le da poder total al admin, no tiene sentido restringirlo)
    ProductCategory.create(product_id: @product.id, category_id: association_changes[:add_category]).id if !association_changes[:add_category].blank?
    ProductCategory.where(category_id: association_changes[:remove_category], product_id: @product.id).delete_all if !association_changes[:remove_category].blank?

    ProductTag.create(product_id: @product.id, tag_id: association_changes[:add_tag]).id if !association_changes[:add_tag].blank?
    ProductTag.where(tag_id: association_changes[:remove_tag], product_id: @product.id).delete_all if !association_changes[:remove_tag].blank?

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :details, :prize, :stock)
    end

    def association_changes
      params.require(:product).permit(:add_category, :remove_category, :add_tag, :remove_tag)
    end
end
