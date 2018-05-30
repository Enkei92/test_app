require 'cancan/matchers'

describe Ability do
  describe 'Account' do
    describe 'abilities' do
      subject(:ability) { Ability.new(account) }
      let(:account) { nil }

      context 'when is an account admin' do
        let(:account) { create(:admin) }

        it { should be_able_to(:manage, Account) }
        it { should be_able_to(:manage, Customer) }
        it { should be_able_to(:manage, Vendor) }
        it { should be_able_to(:manage, CustomMail) }
      end

      context 'when is not signed in' do
        it { should be_able_to(:read, Account) }
        it { should_not be_able_to(:manage, CustomMail) }
        it { should_not be_able_to(:manage, Vendor) }
        it { should_not be_able_to(:manage, Customer) }
      end

      context 'when is an vendor account' do
        let(:account) { create(:new_account) }

        it { should be_able_to(:read, Account) }
        it { should be_able_to(:manage, Vendor) }
        it { should_not be_able_to(:manage, Customer) }
        it { should_not be_able_to(:manage, CustomMail) }
      end

      context 'when is an customer account' do
        let(:account) { create(:new_account_customer) }

        it { should be_able_to(:read, Account) }
        it { should be_able_to(:manage, Customer) }
        it { should_not be_able_to(:manage, Vendor) }
        it { should_not be_able_to(:manage, CustomMail) }
      end
    end
  end
end
