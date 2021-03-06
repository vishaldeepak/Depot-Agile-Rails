class LintItemsController < ApplicationController
  include CurrentCart
  before_action :set_lint_item, only: [:show, :edit, :update, :destroy, :decrement]
  before_action :set_cart, only: [:create, :decrement]
  skip_before_action :authorize, only: [:create, :decrement]
  # GET /lint_items
  # GET /lint_items.json
  def index
    @lint_items = LintItem.all
  end


  def decrement # To decrement , created a route 
    @lint_item = @lint_item.decrement  
    respond_to do |format|
      if @lint_item.save
        format.html { redirect_to store_url}
        format.js {@current_item = @lint_item}
      end
    end
  end

  # GET /lint_items/1
  # GET /lint_items/1.json
  def show
  end

  # GET /lint_items/new
  def new
    @lint_item = LintItem.new
  end

  # GET /lint_items/1/edit
  def edit
  end

  # POST /lint_items
  # POST /lint_items.json
  def create
    product = Product.find(params[:product_id])
    @lint_item = @cart.add_product(product.id)
    #session[:counter]=0


    respond_to do |format|
      if @lint_item.save
        format.js   { @current_item = @lint_item }
        format.html { redirect_to store_url}#notice was removed as we did not need it 
        format.json { render :show, status: :created, location: @lint_item }
      else
        format.html { render :new }
        format.json { render json: @lint_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lint_items/1
  # PATCH/PUT /lint_items/1.json
  def update
    respond_to do |format|
      if @lint_item.update(lint_item_params)
        format.html { redirect_to @lint_item, notice: 'Lint item was successfully updated.' }
        format.json { render :show, status: :ok, location: @lint_item }
      else
        format.html { render :edit }
        format.json { render json: @lint_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lint_items/1
  # DELETE /lint_items/1.json
  def destroy
    @lint_item.destroy
    respond_to do |format|
      format.html { redirect_to lint_items_url }
      format.json { head :no_content }
    end
=begin
    @lint_item = LintItem.find(params[:id])
    @lint_item.destroy
    respond_to do |format|
      if @lint_item.cart.lint_items.empty?
        format.html { redirect_to store_url, notice: 'Your cart is empty' }
      else  
        format.html { redirect_to @lint_item.cart, notice: 'Product was successfully Removed.'}
      end
        format.json { head :no_content }
      end
=end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lint_item
      @lint_item = LintItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lint_item_params
      params.require(:lint_item).permit(:product_id)
    end
end
