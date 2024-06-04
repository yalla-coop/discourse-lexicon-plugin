# frozen_string_literal: true

module DeeplinkNotification
  def build_email(*builder_args)
    if SiteSetting.lexicon_email_deep_linking_enabled
      user_email, opts = builder_args

      # Logic for user notifications
      if opts.key?(:template) && opts[:template].respond_to?(:include?) &&
           (opts[:template].include? "user_notifications.user_")
        url = opts[:url].dup
        is_pm = opts[:private_reply]
        opts[:url] = url.prepend("/deeplink").concat("?is_pm=#{is_pm}")
      end

      # Logic for account approval
      if opts.key?(:template) &&
           opts[:template] == "user_notifications.signup_after_approval"
        url = opts[:url].dup
        opts[:url] = url.prepend("/deeplink")
      end
    end

    super(*builder_args)
  end
end
