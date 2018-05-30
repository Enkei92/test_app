describe CustomMail, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:subject).on(:update) }
    it { should validate_presence_of(:body).on(:update) }
  end
end
