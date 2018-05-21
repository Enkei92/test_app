class CustomMailsController < ApplicationController
  load_and_authorize_resource
  before_action :set_mail, only: %i[show edit update]
  AFTER_REG = '%<email>s, %<role>s'.freeze
  AFTER_PROFILE = '%<email>s, %<role>s, %<name>s, %<last_name>s, %<city>s, %<age>s, %<total_account>s'.freeze

  def show; end

  def index
    @custom_mails = CustomMail.all
  end

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

  def set_mail
    @custom_mail = CustomMail.find(params[:id])
  end

  def custom_mail_params
    params.require(:custom_mail).permit(:subject, :body, :mail_type, :enabled_by_admin)
  end
end
