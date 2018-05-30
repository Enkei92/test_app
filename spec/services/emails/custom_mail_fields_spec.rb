describe Emails::CustomMailFields do
  it 'Then builds hash for just registered account' do
    account = create(:new_account)
    variables = Emails::CustomMailFields.new(account).call

    expect(variables[:email]).to be_present
    expect(variables[:role]).to be_present
  end

  it 'Then builds hash for filled account' do
    account = create(:filled_account)
    variables = Emails::CustomMailFields.new(account).call

    expect(variables[:email]).to be_present
    expect(variables[:role]).to be_present
    expect(variables[:first_name]).to be_present
    expect(variables[:last_name]).to be_present
    expect(variables[:city]).to be_present
    expect(variables[:age]).to be_present
    expect(variables[:total_account]).to be_present
  end
end
