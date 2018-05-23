class CustomMailsController < ApplicationController
  load_and_authorize_resource

  def index
    @custom_mails = CustomMail.all
  end

  def show; end

  def edit; end

  def update
    if custom_mail.update(custom_mail_params)
      redirect_to custom_mail
    else
      render :edit
    end
  end

  private

  attr_reader :custom_mail

  def custom_mail_params
    params.require(:custom_mail).permit(:subject, :body, :mail_type, :enabled_by_admin)
  end
end
