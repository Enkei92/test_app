class AccountMailer < ApplicationMailer
  def send_mail(account, mail_name, reciever)
    @account = account
    @custom_mail = CustomMail.send(mail_name).first
    return unless @custom_mail.enabled_by_admin?
    mail(to: reciever, subject: @custom_mail.subject,
         content_type: 'html/text', body: CustomMailService.interpolate_mail(@account, @custom_mail.mail_type))
  end
end
