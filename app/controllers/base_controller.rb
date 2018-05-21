class BaseController < ApplicationController
  def create
    model = build_model
    if model.save
      mails_after_registration
      redirect_to model_account
    else
      render :new
    end
  end

  def update
    if update_model
      redirect_to model_account
    else
      render :edit
    end
  end

  private

  def mails_after_registration
    AccountMailer.send_mail(model_account, 'profile', model_account.email).deliver_later
    AccountMailer.send_mail(model_account, 'profile_admin', Account.admin.first.email).deliver_later
  end

  def model_account
    model.account
  end
end
