class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = current_account.build_customer(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Your profile successfully created!' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity  }
      end
    end  
  end

  def edit
  end  

  def update
    if @customer.update_attributes(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :city, :age)
  end
end
