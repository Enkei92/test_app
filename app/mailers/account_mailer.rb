class AccountMailer < ApplicationMailer
  WEEK = 3600 * 7 * 24
  def send_mail(mail_type, reciever, account)
    @account = account
    @custom_mail = CustomMail.send(mail_type).last
    return unless custom_mail.enabled_by_admin?
    if body
      mail(to: reciever, subject: custom_mail.subject,
           content_type: 'html/text', body: body)
    else
      about_error(error)
    end
  end

  private

  attr_reader :account, :custom_mail, :error

  def body
    @message ||= Emails::InterpolationContext.new(account, custom_mail).call
  rescue KeyError => er
    @error = er.message
    false
  end

  def about_error(error)
    return if REDIS_CLIENT.exists(error)
    mail(to: Account::ADMIN_EMAIL, subject: 'Error handled!', content_type: 'html/text')
    REDIS_CLIENT.set(error, nil, ex: WEEK)
  end
end
