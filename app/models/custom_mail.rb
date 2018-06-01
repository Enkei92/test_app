class CustomMail < ApplicationRecord
  enum mail_type: { welcome: 0, admin_after_create: 1, profile: 2, profile_admin: 3 }
  validates :subject, presence: true, on: :update
  validates :body, presence: true, on: :update
end
