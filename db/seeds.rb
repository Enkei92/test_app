# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Custom mails
welcome = CustomMail.create(subject: 'Welcome!', body: 'Hey, %<email>s!
your role is %<role>s!', mail_type: 'welcome', enabled_by_admin: true)
admin_after_create = CustomMail.create(subject: 'New account has been created!', body: 'New account, email: %<email>s!,
 role: %<role>s!', mail_type: 'admin_after_create', enabled_by_admin: true)
profile = CustomMail.create(subject: 'Profile accepted!', body: 'Your profile accepted. Name: %<first_name>s %<last_name>s.', mail_type: 'profile', enabled_by_admin: true)
profile_admin = CustomMail.create(subject: 'New profile!', body: 'New profile, Name: %<first_name>s %<last_name>s.', mail_type: 'profile_admin', enabled_by_admin: true)
# Admin user
admin = Account.create(email: 'admin123@mail.com', password: '123456', role: 'admin')
