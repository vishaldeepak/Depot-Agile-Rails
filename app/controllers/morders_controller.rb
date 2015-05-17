class MordersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]
  before_action :set_morder, only: [:show, :edit, :update, :destroy]

  # GET /morders
  # GET /morders.json
  def index
    @morders = Morder.all
  end

  # GET /morders/1
  # GET /morders/1.json
  def show
  end

  # GET /morders/new
  def new
    if @cart.lint_items.empty?
      redirect_to store_url, notice: "Your cart is empty"
      return
    end

    @morder = Morder.new
  end


  # GET /morders/1/edit
  def edit
  end

  # POST /morders
  # POST /morders.json
  def create
    @morder = Morder.new(morder_params)
    @morder.add_lint_items_from_cart(@cart)

    respond_to do |format|
      if @morder.save
        Cart.destroy(session[:cart_id])
        session[:cart_id]=nil
        OrderNotifier.received(@morder).deliver_now #Send mail to user about purchase
        format.html { redirect_to store_url, notice: 'Thank you for Order' }
        format.json { render :show, status: :created, location: @morder }
      else
        format.html { render :new }
        format.json { render json: @morder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /morders/1
  # PATCH/PUT /morders/1.json
  def update
    respond_to do |format|
      if @morder.update(morder_params)
        format.html { redirect_to @morder, notice: 'Morder was successfully updated.' }
        format.json { render :show, status: :ok, location: @morder }
      else
        format.html { render :edit }
        format.json { render json: @morder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /morders/1
  # DELETE /morders/1.json
  def destroy
    @morder.destroy
    respond_to do |format|
      format.html { redirect_to morders_url, notice: 'Morder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_morder
      @morder = Morder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def morder_params
      params.require(:morder).permit(:name, :address, :email, :pay_type)
    end
end
