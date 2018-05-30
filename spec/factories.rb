FactoryBot.define do
  factory :new_account, class: Account do
    email 'new_account@mail.com'
    password 'password'
    role 'vendor'
    status 'no_letters'
  end

  factory :new_account_customer, class: Account do
    email 'new_account@mail.com'
    password 'password'
    role 'customer'
    status 'no_letters'
  end

  factory :filled_account, class: Account do
    email 'filled_account@mail.com'
    password 'password'
    role 'vendor'
    first_name 'James'
    last_name 'Bond'
    city 'London'
    age 42
    status 'got_letter'
    vendor
  end

  factory :admin, class: Account do
    email 'admin@mail.com'
    password 'password'
    role 'admin'
  end

  factory :customer, class: Customer do
    total_account 9900
  end

  factory :vendor, class: Vendor do
    total_account 7728
  end

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
