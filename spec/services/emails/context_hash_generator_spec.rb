describe Emails::ContextHashGenerator do
  let(:variables) { described_class.new(keys, account).call }

  describe 'Just registered account' do
    let(:account) { create(:new_account) }
    let(:keys) { Emails::CustomMailFields::NEW_ACCOUNT_VARIABLES }

    it 'Then builds hash for just registered account' do
      expect(variables[:email]).to eq account.email
      expect(variables[:role]).to eq account.role
    end
  end

  describe 'Filled account' do
    let(:account) { create(:filled_account) }
    let(:keys) { Emails::CustomMailFields::FILLED_ACCOUNT_VARIABLES }

    it 'Then builds hash for filled account' do
      expect(variables[:email]).to eq account.email
      expect(variables[:role]).to eq account.role
      expect(variables[:first_name]).to eq account.first_name
      expect(variables[:last_name]).to eq account.last_name
      expect(variables[:city]).to eq account.city
      expect(variables[:age]).to eq account.age
      expect(variables[:total_account]).to eq account.total_account
    end
  end
end
