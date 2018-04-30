class AccountsController < ApplicationController
  before_action :set_account, only: %i[show edit update destroy]
  before_action :set_status, only: :update
  load_and_authorize_resource

  def index
    @accounts = Account.all
  end

  def edit
    unless current_account.admin? || @account.status == 'no_letters'
        redirect_to @account
    end
  end

  def update
    if @account.update_attributes(account_params)
      AccountMailer.profile_email(@account).deliver_later
      AccountMailer.admin_profile_email(@account).deliver_later
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
    params.require(:account).permit(:first_name, :last_name, :city, :age)
  end
end
