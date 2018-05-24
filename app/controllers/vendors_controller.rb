class VendorsController < BaseController
  load_and_authorize_resource

  private

  attr_reader :vendor

  def vendor_params
    params.require(:vendor).permit(:total_account)
  end

  def build_model
    current_account.build_vendor(vendor_params)
  end

  def update_model
    model.update(vendor_params)
  end

  def model
    @model ||= vendor
  end
end
