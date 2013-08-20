require 'addressable/uri'

module ShippingLabel
  module UrlFor
    def url_for(original_url)
      url_with_shipping_label_params(super)
    end

    private

    def url_with_shipping_label_params(url)
      unless params_to_add.empty?
        url = ::Addressable::URI.parse(url)
        url.query_values = params_to_add.merge(url.query_values || {})
      end

      url.to_s.html_safe
    end

    def params_to_add
      @_params_to_add ||= controller.shipping_label_params.with_indifferent_access
    end
  end
end
