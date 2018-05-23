module Emails
  class CustomMailFields
    NEW_ACCOUNT_VARIABLES = %i[email role].freeze
    FILLED_ACCOUNT_VARIABLES = %i[email role first_name last_name city age total_account].freeze
    delegate :email, :role, :first_name, :last_name, :city, :age, :total_account, to: :account

    def initialize(account)
      @account = account
    end

    def call
      all_fields = Emails::CustomMailFields.new(account)
      if account.no_letters?
        all_fields.generate_hash(NEW_ACCOUNT_VARIABLES)
      else
        all_fields.generate_hash(FILLED_ACCOUNT_VARIABLES)
      end
    end

    def generate_hash(keys)
      keys.inject({}) do |hash, key|
        hash.merge(key => send(key))
      end
    end

    private

    attr_reader :account
  end
end
