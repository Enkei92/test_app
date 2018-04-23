class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  scope :without_admin, -> { where(role: 2) }       
  enum role: {Vendor: 0, Customer: 1, Admin: 2}


end
