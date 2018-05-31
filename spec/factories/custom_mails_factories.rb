FactoryBot.define do
  factory :new_account_mail, class: CustomMail do
    subject 'Welcome!'
    body 'Hi, %<email>s!'
    mail_type 'welcome'
  end

  factory :error_mail, class: CustomMail do
    subject 'Error handled!'
    body '%<error>s'
    mail_type 'welcome'
  end
end
