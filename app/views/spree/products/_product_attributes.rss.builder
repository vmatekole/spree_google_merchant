google_merchant_product_category = Spree::Property.where(name: "google_merchant_product_category").first
google_merchant_brand = Spree::Property.where(name: "google_merchant_brand").first
google_merchant_department = Spree::Property.where(name: "google_merchant_department").first
google_merchant_color = Spree::Property.where(name: "google_merchant_color").first
google_merchant_gtin = Spree::Property.where(name: "google_merchant_gtin").first

category = variant.product.product_properties.where(property_id: google_merchant_product_category.id).first
brand = variant.product.product_properties.where(property_id: google_merchant_brand.id).first
department = variant.product.product_properties.where(property_id: google_merchant_department.id).first
color = variant.product.product_properties.where(property_id: google_merchant_color.id).first
gtin = variant.product.product_properties.where(property_id: google_merchant_gtin.id).first

xml.title "#{variant.product.name} #{variant_options variant}"
xml.description variant.product.description
xml.link @production_domain + 'products/' + variant.product.permalink
xml.tag! "sku", variant.sku.to_s
xml.tag! "price", variant.price
xml.tag! "category", category.value if category
xml.tag! "brand", brand.value if brand
xml.tag! "department", department.value if department
xml.tag! "image", variant.product.images.first.attachment.url(:product) unless variant.product.images.empty?
xml.tag! "color", color.value if color
xml.tag! "GTIN", gtin.value if gtin
xml.tag! "g:condition", "new"
xml.tag! "g:availability", variant.count_on_hand > 0 ? 'in stock' : 'out of stock'
xml.tag! "shipping_weight", variant.weight.to_s
