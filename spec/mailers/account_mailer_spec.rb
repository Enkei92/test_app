require 'rails_helper'

RSpec.describe AccountMailer, type: :mailer do
  after(:each) do
    ActionMailer::Base.deliveries.clear
  end

  describe 'normal mail' do
    before(:each) do
      normal_mail = create(:new_account_mail)
      account = create(:new_account)
      AccountMailer.send_mail(normal_mail.mail_type, account.email, account).deliver
    end

    it 'should send an email' do
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it 'renders the headers' do
      expect(ActionMailer::Base.deliveries.first.to).to eq ['new_account@mail.com']
      expect(ActionMailer::Base.deliveries.first.subject).to eq 'Welcome!'
      expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
    end

    it 'renders the body' do
      expect(ActionMailer::Base.deliveries.first.body.raw_source).to eql 'Hi, new_account@mail.com!'
    end
  end

  describe 'mail with error' do
    before(:each) do
      error_mail = create(:error_mail)
      account = create(:new_account)
      AccountMailer.send_mail(error_mail.mail_type, account.email, account).deliver
      @obj = AccountMailer.send_mail(error_mail.mail_type, account.email, account)
    end

    it 'renders the headers of mail about error' do
      expect(ActionMailer::Base.deliveries.first.to).to eq [Account::ADMIN_EMAIL]
      expect(ActionMailer::Base.deliveries.first.subject).to eq 'Error handled!'
      expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
    end
  end
end
