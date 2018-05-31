describe AccountMailer, type: :mailer do
  after do
    ActionMailer::Base.deliveries.clear
  end

  let(:account) { create(:new_account) }
  let(:mail) { create(:new_account_mail) }
  let(:error_mail) { create(:error_mail) }
  let(:subject) { described_class.send_mail(mail.mail_type, account.email, account) }

  describe 'normal mail' do
    it 'should send an email' do
      subject.deliver
      expect(ActionMailer::Base.deliveries.count).to eq 1
    end

    it 'renders the headers' do
      subject.deliver
      expect(ActionMailer::Base.deliveries.first.to).to eq ['new_account@mail.com']
      expect(ActionMailer::Base.deliveries.first.subject).to eq 'Welcome!'
      expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
    end

    it 'renders the body' do
      subject.deliver
      expect(ActionMailer::Base.deliveries.first.body.raw_source).to eql 'Hi, new_account@mail.com!'
    end
  end

  describe 'mail with error' do
    let(:mail) { create(:error_mail) }

    it 'renders the headers of mail about error' do
      subject.deliver
      expect(ActionMailer::Base.deliveries.first.to).to eq [Account::ADMIN_EMAIL]
      expect(ActionMailer::Base.deliveries.first.subject).to eq 'Error handled!'
      expect(ActionMailer::Base.deliveries.first.from).to eq ['from@example.com']
    end
  end
end
