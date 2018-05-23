class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { vendor: 0, customer: 1, admin: 2 }
  enum status: { no_letters: 0, got_letter: 1 }
  validates :first_name, presence: true, length: { minimum: 3, maximum: 15 }, on: :update
  validates :last_name, presence: true, length: { minimum: 3, maximum: 15 }, on: :update
  validates :city, presence: true, length: { minimum: 2, maximum: 20 }, on: :update
  validates :age, presence: true, numericality:
    { only_integer: true, greater_than_or_equal_to: 16, less_than_or_equal_to: 99 }, on: :update
  has_one :vendor, dependent: :destroy
  has_one :customer, dependent: :destroy
  after_create :after_create_mail
  ADMIN_EMAIL = 'admin123@mail.com'.freeze
  WELCOME = 'welcome'.freeze
  ADMIN_MAIL_AFTER_CREATE = 'admin_after_create'.freeze
  PROFILE_MAIL = 'profile'.freeze
  PROFILE_MAIL_ADMIN = 'profile_admin'.freeze

  def after_create_mail
    AccountMailer.send_mail(self, WELCOME, email).deliver_later
    AccountMailer.send_mail(self, ADMIN_MAIL_AFTER_CREATE, ADMIN_EMAIL).deliver_later
  end

  def self.user_roles
    Account.roles.except(:admin)
  end

  def total_account
    if vendor?
      vendor.total_account
    elsif customer?
      customer.total_account
    end
  end
end
