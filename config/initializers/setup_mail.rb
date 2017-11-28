  if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address:        'smtp.gmail.com',
        port:           587,
        authentication: 'plain',
        user_name:      'kevwong8884@gmail.com',
        password:       'Kw@39768',
        domain:         'gmail.com',
        enable_starttls_auto: true
    }
  end