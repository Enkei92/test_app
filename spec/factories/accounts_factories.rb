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
end
