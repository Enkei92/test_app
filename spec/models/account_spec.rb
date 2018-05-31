describe Account, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:first_name).on(:update) }
    it { should validate_presence_of(:last_name).on(:update) }
    it { should validate_presence_of(:city).on(:update) }
    it { should validate_presence_of(:age).on(:update) }
  end

  context 'Associations' do
    it { should have_one(:vendor) }
    it { should have_one(:customer) }
  end

  describe '.user_roles' do
    it 'returns every possible account role except admin' do
      possible_roles = described_class.user_roles
      expect(possible_roles).to eq 'vendor' => 0, 'customer' => 1
    end
  end

  describe '.typed_model' do
    it 'returns typed model object' do
      account = build(:filled_account)
      account.typed_model == :vendor
    end
  end
end
