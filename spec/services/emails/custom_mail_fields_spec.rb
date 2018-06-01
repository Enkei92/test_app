describe Emails::CustomMailFields do
  subject { described_class.new(account).call }

  context 'And account has no letters' do
    let(:account) { create(:new_account, status: 'no_letters') }
    let(:fake_result) { double }

    describe '.call' do
      it 'Calls Emails::ContextHashGenerator' do
        expect(Emails::ContextHashGenerator).to receive_message_chain(:new, :call).with(described_class::NEW_ACCOUNT_VARIABLES, account).with(no_args).and_return(fake_result)
        expect(subject).to eq(fake_result)
      end
    end
  end
end
