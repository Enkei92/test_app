class AccountMailer < ApplicationMailer
  def welcome_email(account)
    @account = account
    @custom_mail = CustomMail.welcome.last
    return unless @custom_mail.enabled_by_admin?
    mail(to: account.email, subject: @custom_mail.subject,
         content_type: 'html/text', body: with_inter)
  end

  def admin_after_create_email(account)
    @account = account
    @custom_mail = CustomMail.admin_after_create.last
    return unless @custom_mail.enabled_by_admin?
    mail(to: 'admin123@mail.com', subject: @custom_mail.subject,
         content_type: 'html/text', body: with_inter)
  end

  def profile_email(account)
    @account = account
    @custom_mail = CustomMail.profile.last
    return unless @custom_mail.enabled_by_admin?
    mail(to: account.email, subject: @custom_mail.subject,
         content_type: 'html/text', body: with_inter)
  end

  def admin_profile_email(account)
    @account = account
    @custom_mail = CustomMail.profile_admin.last
    return unless @custom_mail.enabled_by_admin?
    mail(to: 'admin123@mail.com', subject: @custom_mail.subject,
         content_type: 'html/text', body: with_inter)
  end

  private

  attr_reader :account

  def with_inter
    if @custom_mail.mail_type == 'welcome' || @custom_mail.mail_type == 'admin_after_create'
      format(@custom_mail.body, just_registered_account)
    else
      format(@custom_mail.body, full_account)
    end
  end

  def full_account
    { email: account.email, role: account.role, first_name: account.first_name,
      last_name: account.last_name, city: account.city, age: account.age }
  end

  def just_registered_account
    { email: account.email, role: account.role }
  end

  def enabled_mail?
    @custom_mail.enabled_by_admin
  end
end
