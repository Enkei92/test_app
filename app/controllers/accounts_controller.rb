class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  before_action :set_status, only: %i[edit update]

  def index
    @accounts = Account.all
  end

  def edit
    if current_account.role != 'admin' && @account.status != 'no_letter'
      redirect_to @account
    end
  end

  def update
    if @account.update_attributes(account_params)
      AccountMailer.send_profile_email(@account).deliver
      AccountMailer.send_admin_profile_email(@account).deliver
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

  def set_status
    @account.status = 'got_letter'
  end

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:name, :city, :age, :status)
  end
end
