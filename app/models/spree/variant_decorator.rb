module Spree
  Variant.class_eval do
    has_one(
      :advertising_image,
      Spree::GoogleMerchant::Manager.advertising_image_proc,
      as: :viewable,
      class_name: "Spree::Image"
    )
    has_one :master, ->{where(is_master: true)}, primary_key: :product_id, foreign_key: :product_id, class_name: "Spree::Variant"
  end
end
