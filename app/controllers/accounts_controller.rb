class AccountsController < ApplicationController
  load_and_authorize_resource
  before_action :set_status, only: :update

  def index
    @accounts = Account.all
  end

  def show
    @vendor = account.vendor
    @customer = account.customer
  end

  def update
    if account.update(account_params)
      redirect_to account
    else
      render :edit
    end
  end

  def destroy
    account.destroy
    redirect_to accounts_path
  end

  private

  attr_reader :account

  def set_status
    account.status = 'got_letter'
  end

  def account_params
    params.require(:account).permit(:first_name, :last_name, :city, :age)
  end
end
