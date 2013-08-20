class UserMailer < ActionMailer::Base
  default :from => 'no-reply@example.com'

  shipping_label utm_source: 'newsletter', utm_medium: 'email'

  # simulate url helper
  helper do
    def newsletter_url(params = {})
      'http://www.example.com/newsletter'.tap do |u|
        u << "?#{params.to_param}" if params.any?
      end.html_safe
    end
  end

  def welcome
    mail(to: 'user@example.com')
  end

  def welcome_again
    override_shipping_label utm_source: 'second_newsletter', utm_term: 'welcome_again'
    mail(to: 'user@example.com', template_name: 'welcome')
  end
end
