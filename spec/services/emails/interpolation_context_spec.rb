describe Emails::CustomMailFields do
  it 'It interpolatets variables' do
    account = create(:new_account)
    mail = create(:new_account_mail)
    body = Emails::InterpolationContext.new(account, mail).call
    final_body = 'Hi, new_account@mail.com!'
    expect(body).to eql(final_body)
  end
end
