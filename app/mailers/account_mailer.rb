class AccountMailer < ApplicationMailer
  def send_mail(account, mail_type, reciever)
    @account = account
    @custom_mail = CustomMail.send(mail_type).first
    return unless custom_mail.enabled_by_admin?
    mail(to: reciever, subject: custom_mail.subject,
         content_type: 'html/text', body: Emails::MailsInterpolationContext.new(account, custom_mail).call)
  end

  private

  attr_reader :account, :custom_mail
end
