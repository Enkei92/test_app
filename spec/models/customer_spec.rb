describe Customer, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:total_account) }
  end

  context 'Associations' do
    it { should belong_to(:account) }
  end
end
