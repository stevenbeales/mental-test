# frozen_string_literal: true

require 'secure_headers'

def config_cookies(config)
  config.cookies = {
    secure: true, # mark all cookies as "Secure"
    httponly: true, # mark all cookies as "HttpOnly"
    samesite: {
      lax: true # mark all cookies as SameSite=lax
    }
  }
end

def config_x_headers(config)
  # Add "; preload" and submit the site to hstspreload.org for best protection.
  config.hsts = "max-age=#{1.week.to_i}"
  config.x_frame_options = 'DENY'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = '1; mode=block'
  config.x_download_options = 'noopen'
  config.x_permitted_cross_domain_policies = 'none'
  config.referrer_policy = %w[origin-when-cross-origin strict-origin-when-cross-origin]
end

def config_report(config)
  # This is available only from 3.5.0;  
  config.csp_report_only = config.csp.merge(
    img_src: %w[somewhereelse.com],
    report_uri: %w[https://report-uri.io/example-csp-report-only]
  )
end

SecureHeaders::Configuration.default do |config|
  config_cookies(config)
  config_x_headers(config)
  config_report(config)
end
