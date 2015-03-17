module Spree
  ProductsController.class_eval do
    def google_merchant
      @in_stock = Variant.in_stock.pluck(:id)
      if GoogleMerchant::Manager.include_variants?
        @items = Variant.active.where(is_master: false).includes(
          :product,
          :advertising_image,
          :default_price,
          :stock_items,
          :master,
          {option_values: :option_type}
        )
        @properties = GoogleMerchant::Manager.property_set(
          @items.collect(&:product).uniq.sort_by(&:id)
        )
      else
        @items = Product.active.includes(:variants)
        @properties = GoogleMerchant::Manager.property_set(@items)
      end
    end
  end
end
