module InvoiceCheckout
  class Railtie < Rails::Railtie

    initializer "my_railtie.configure_rails_initialization" do |app|
      FeatureBase.register(app, InvoiceCheckout)
    end

    config.after_initialize do
      FeatureBase.inject_feature_record("Invoice Checkout",
        "InvoiceCheckout",
        "Checkout using an invoice."
      )
      FeatureBase.inject_permission_records(
        InvoiceCheckout,
        InvoiceCheckoutFeatureDefinition.new.permissions
      )
    end

  end
end
