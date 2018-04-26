class VendorsController < ApplicationController
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = current_account.build_vendor(vendor_params)
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Your profile successfully created!' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity  }
      end
    end  
  end

  def edit
  end  

  def update
    if @vendor.update_attributes(vendor_params)
      redirect_to @vendor
    else
      render :edit
    end
  end

  def destroy
    @vendor.destroy
    redirect_to vendors_path
  end

  private

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

  def vendor_params
    params.require(:vendor).permit(:name, :city, :age)
  end
end
