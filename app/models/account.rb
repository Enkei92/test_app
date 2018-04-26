class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable      
  enum role: { vendor: 0, customer: 1, admin: 2 }
  has_one :vendor
  has_one :customer

  def self.without_admin
    Account.roles.except(:admin)
  end	

end
