class AccountMailer < ApplicationMailer
  default from: 'test@example.com'
  
  def send_welcome_email(account)
    @account = account
    mail(to: @account.email, subject: "Welcome!")
  end

  def send_admin_after_create_email(account)
  	@account = account
    mail(to: 'admin123@mail.com', subject: "New account has been created!")
  end

  def send_profile_email(account)
    @account = account
    mail(to: @account.email, subject: "Profile!")
  end

  def send_admin_profile_email(account)
  	@account = account
    mail(to: 'admin123@mail.com', subject: "Profile updated!")
  end
end
