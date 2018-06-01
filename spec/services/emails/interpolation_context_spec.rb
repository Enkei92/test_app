describe Emails::InterpolationContext do
  let(:account) { create(:new_account) }
  let(:mail) { create(:new_account_mail) }
  let(:subject) { described_class.new(account, mail).call }

  describe '.call' do
    it 'It interpolatets variables' do
      expect(subject).to eql('Hi, new_account@mail.com!')
    end
  end
end
