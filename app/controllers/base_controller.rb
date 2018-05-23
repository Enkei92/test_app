class BaseController < ApplicationController
  delegate :account, to: :model, prefix: true

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
    AccountMailer.send_mail(Account::PROFILE_MAIL, model_account.email, model_account).deliver_later
    AccountMailer.send_mail(Account::PROFILE_MAIL_ADMIN, Account::ADMIN_EMAIL, model_account).deliver_later
  end
end
