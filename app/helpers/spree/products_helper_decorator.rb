module Spree
  ProductsHelper.class_eval do
    def google_merchant_tag(xml, key, value)
      if value.respond_to?(:keys)
        xml.tag! "g:#{key}" do
          value.each do |sub_key, sub_value|
            google_merchant_tag(xml, sub_key, sub_value)
          end
        end
      else
        xml.tag! "g:#{key}", value if value
      end
    end
  end
end
