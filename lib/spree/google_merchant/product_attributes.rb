module Spree
  module GoogleMerchant
    class ProductAttributes
      DEFAULT_MAPPING = {
        google_merchant_product_category: "google_product_category",
        google_merchant_brand: "brand",
        google_merchant_department: "department",
        google_merchant_color: "color",
        google_merchant_gtin: "gtin"
      }

      attr_accessor :product_fallbacks
      attr_writer :include_variants
      attr_reader :product_mapping, :variant_mapping

      def initialize
        @product_mapping = HashWithIndifferentAccess.new(DEFAULT_MAPPING)
        @product_fallbacks = {}
        @variant_mapping = {}
        @include_variants = false
      end

      def product_mapping=(hash)
        @product_mapping = HashWithIndifferentAccess.new(hash)
      end

      def variant_mapping=(hash)
        @variant_mapping = HashWithIndifferentAccess.new(hash)
      end

      def product_keys
        @product_mapping.keys
      end

      def variant_keys
        @variant_mapping.keys
      end

      def include_variants?
        @include_variants
      end

      def property_ids
        Spree::Property.where(name: product_keys)
      end

      def lookup_properties
        @properties = Spree::ProductProperty.google_properties.inject(
          Hash.new { [] }
        ) do |properties, pp|
          properties.merge(pp.product_id => (properties[pp.product_id] || []) << pp)
        end
      end

      def property_set(products)
        lookup_properties
        products.inject(HashWithIndifferentAccess.new) do |set, product|
          set.merge(product => properties_for(product))
        end
      end

      def properties_for(product)
        @properties[product.id].inject(
          HashWithIndifferentAccess.new(@product_fallbacks)
        ) do |x, gp|
          x.merge(@product_mapping[gp.name] => gp.value)
        end
      end

      def option_values_for(variant)
        all_values = variant.option_values
        variant_keys.inject(HashWithIndifferentAccess.new) do |values, key|
          value = all_values.detect {|v| v.option_type.name == key}.try(:presentation)
          value ? values.merge(variant_mapping[key] => value) : values
        end
      end
    end
  end
end
