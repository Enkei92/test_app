class Customer < ApplicationRecord
  validates :total_account, presence: true
  belongs_to :account, optional: true
end
