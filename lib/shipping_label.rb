require 'shipping_label/version'
require 'shipping_label/url_for'
require 'active_support/concern'
require 'action_mailer'

module ShippingLabel
  def shipping_label(params = {})
    cattr_accessor(:shipping_label_class_params) { params }
    include Helpers
  end

  module Helpers
    extend ActiveSupport::Concern

    included do
      helper ShippingLabel::UrlFor
    end

    def override_shipping_label(params)
      self.shipping_label_overrides = params
    end

    def shipping_label_params
      self.class.shipping_label_class_params.merge(shipping_label_overrides || {})
    end

    private

    attr_accessor :shipping_label_overrides
  end
end

ActionMailer::Base.send :extend, ShippingLabel
