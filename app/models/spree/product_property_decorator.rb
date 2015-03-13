module Spree
  ProductProperty.class_eval do
    scope :google_properties, ->{
      select(
        "#{ProductProperty.table_name}.*, #{Property.table_name}.name"
      ).joins(
        :property
      ).where(
        property_id: GoogleMerchant::Manager.property_ids
      )
    }
  end
end
