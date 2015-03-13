module Spree
  Variant.class_eval do
    has_one :first_image, ->{order(:position)}, as: :viewable, dependent: :destroy, class_name: "Spree::Image"
    has_one :master, ->{where(is_master: true)}, primary_key: :product_id, foreign_key: :product_id, class_name: "Spree::Variant"
  end
end
