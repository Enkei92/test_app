class CustomMailService
  class << self
    def interpolate_mail(account, mail_name)
      @account = account
      @custom_mail = CustomMail.send(mail_name).first
      with_inter(custom_mail.mail_type)
    end

    private

    attr_reader :account, :custom_mail

    def with_inter(mail_name)
      inter = { welcome: :just_registered_account, admin_after_create: :just_registered_account, profile: :full_account,
                profile_admin: :full_account }
      send(inter[mail_name.to_sym])
    end

    def full_account
      full_account = { email: account.email, role: account.role, first_name: account.first_name,
                       last_name: account.last_name, city: account.city }
      add_total_account(full_account)
      format(custom_mail.body, full_account)
    end

    def add_total_account(full_account)
      if account.vendor?
        full_account[:total_account] = account.vendor.total_account
      elsif account.customer?
        full_account[:total_account] = account.customer.total_account
      end
    end

    def just_registered_account
      just_registered_account = { email: account.email, role: account.role }
      format(custom_mail.body, just_registered_account)
    end
  end
end
