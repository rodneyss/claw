class VouchersController < ApplicationController
  before_action :set_voucher, only: [:show, :edit, :update, :destroy]

  # GET /vouchers
  # GET /vouchers.json
  def index
    if @current_user.admin
      @vouchers = Voucher.all
    else
      redirect_to root_path
    end
  end

  # GET /vouchers/1
  # GET /vouchers/1.json
  def show
    if !@current_user.admin
      redirect_to root_path
    end
  end

  def item
    @voucher = Voucher.find params[:voucher][:vID]
    render :json => @voucher
  end

  def redeem
    redeemedVID = params[:voucher][:vID]
    @current_user.vouchers.delete(redeemedVID)
  end

  # GET /vouchers/new
  def new
    if @current_user.admin
      @voucher = Voucher.new
    else
      redirect_to root_path
    end
  end

  # GET /vouchers/1/edit
  def edit
    if !@current_user.admin
      redirect_to root_path
    end
  end

  # POST /vouchers
  # POST /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to @voucher, notice: 'Voucher was successfully created.' }
        format.json { render :show, status: :created, location: @voucher }
      else
        format.html { render :new }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1
  # PATCH/PUT /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to @voucher, notice: 'Voucher was successfully updated.' }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1
  # DELETE /vouchers/1.json
  def destroy
    @voucher.destroy
    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: 'Voucher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voucher_params
      params.require(:voucher).permit(:name, :description, :expiry, :client_id, :textstuff, :user_id, :vID)
    end
end
