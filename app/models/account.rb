class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { vendor: 0, customer: 1, admin: 2 }
  has_one :vendor, dependent: :destroy
  has_one :customer, dependent: :destroy
  after_create :send_after_create_mail

  def send_after_create_mail
    AccountMailer.send_welcome_email(self).deliver
    AccountMailer.send_admin_after_create_email(self).deliver
  end

  def self.user_roles
    Account.roles.except(:admin)
  end
end
