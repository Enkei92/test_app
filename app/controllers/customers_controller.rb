class CustomersController < BaseController
  load_and_authorize_resource
  delegate :account, to: :customer, prefix: true

  private

  attr_reader :customer

  def customer_params
    params.require(:customer).permit(:total_account)
  end

  def build_model
    current_account.build_customer(customer_params)
  end

  def update_model
    model.update(customer_params)
  end

  def model
    @model ||= customer
  end
end
