require "invoice_checkout/version"

module InvoiceCheckout
  class InvoiceCheckoutFeatureDefinition
    include FeatureSystem::Provides
    def permissions
      [
        {
          can: true,
          callback_name: 'can_pay-via-invoice_product',
          name: 'Can Pay Via Invoice'
        }
      ]
    end
  end

  module Authorization
    module Permissions
    end
  end

end

require 'invoice_checkout/railtie' if defined?(Rails)
