module Emails
  class InterpolationContext
    attr_reader :error

    def initialize(account, custom_mail)
      @account = account
      @custom_mail = custom_mail
    end

    def call
      fields = Emails::CustomMailFields.new(account).call
      format(custom_mail.body, fields)
    end

    private

    attr_reader :account, :custom_mail
  end
end
