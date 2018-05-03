class AccountMailer < ApplicationMailer
  def welcome_email(account)
    @account = account
    mail(to: account.email, subject: 'Welcome!')
  end

  def admin_after_create_email(account)
    @account = account
    mail(to: 'admin123@mail.com', subject: 'New account has been created!')
  end

  def profile_email(account)
    @account = account
    mail(to: account.email, subject: 'Profile!')
  end

  def admin_profile_email(account)
    @account = account
    mail(to: 'admin123@mail.com', subject: 'Profile updated!')
  end

  private

  attr_reader :account
end
