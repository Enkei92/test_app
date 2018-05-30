describe Emails::ContextHashGenerator do
  it 'Then builds hash for just registered account' do
    account = create(:new_account)
    keys = Emails::CustomMailFields::NEW_ACCOUNT_VARIABLES
    variables = Emails::ContextHashGenerator.new(keys, account).call

    expect(variables[:email]).to be_present
    expect(variables[:role]).to be_present
  end

  it 'Then builds hash for filled account' do
    account = create(:filled_account)
    keys = Emails::CustomMailFields::FILLED_ACCOUNT_VARIABLES
    variables = Emails::ContextHashGenerator.new(keys, account).call

    expect(variables[:email]).to be_present
    expect(variables[:role]).to be_present
    expect(variables[:first_name]).to be_present
    expect(variables[:last_name]).to be_present
    expect(variables[:city]).to be_present
    expect(variables[:age]).to be_present
    expect(variables[:total_account]).to be_present
  end
end
