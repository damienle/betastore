# if in production then use production but otherwise use sandbox to test
Braintree::Configuration.environment = Rails.env.production? ? :production : :sandbox

Braintree::Configuration.merchant_id = '7657m2fk8gtwdqyd'
Braintree::Configuration.public_key = 'n8kds6b8642pr8j6'
Braintree::Configuration.private_key = '210456d1061362fe2133c6d0fd40667e'