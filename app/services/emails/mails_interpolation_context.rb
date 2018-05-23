module Emails
  class MailsInterpolationContext
    def initialize(account, custom_mail)
      @account = account
      @custom_mail = custom_mail
    end

    def call
      add_context
    end

    private

    attr_reader :account, :custom_mail

    def add_context
      fields = Emails::CustomMailFields.new(account).call
      format(custom_mail.body, fields)
    end
  end
end
