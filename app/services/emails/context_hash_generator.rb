module Emails
  class ContextHashGenerator
    delegate :email, :role, :first_name, :last_name, :city, :age, :total_account, to: :account

    def initialize(keys, account)
      @keys = keys
      @account = account
    end

    def call
      keys.inject({}) do |hash, key|
        hash.merge(key => send(key))
      end
    end

    private

    attr_reader :keys, :account
  end
end
