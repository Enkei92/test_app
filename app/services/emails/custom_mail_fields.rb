module Emails
  class CustomMailFields
    NEW_ACCOUNT_VARIABLES = %i[email role].freeze
    FILLED_ACCOUNT_VARIABLES = %i[email role first_name last_name city age total_account].freeze

    def initialize(account)
      @account = account
    end

    def call
      if account.no_letters?
        Emails::ContextHashGenerator.new(NEW_ACCOUNT_VARIABLES, account).call
      else
        Emails::ContextHashGenerator.new(FILLED_ACCOUNT_VARIABLES, account).call
      end
    end

    private

    attr_reader :account
  end
end
