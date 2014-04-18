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
      def can_pay_via_invoice
        # authorize! :pay_via_invoice, @payment
        # If user has this permission the are allowed
        # to pay with an invoice.
        # Also verify that the site supports invoice
        # payments
        can :pay_via_invoice, Site do |site|
          site.payment_methods.any? do |pm|
            pm.name == 'Invoice'
          end
        end
      end
    end
  end

end

require 'invoice_checkout/railtie' if defined?(Rails)
