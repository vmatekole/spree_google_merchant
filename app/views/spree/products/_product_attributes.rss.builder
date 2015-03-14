# docs: https://support.google.com/merchants/answer/188494?hl=en

xml.tag! "g:id", variant.sku.to_s
xml.tag! "g:title", "#{variant.product.name} #{variant_options variant}"
xml.tag! "g:description", variant.product.description
xml.tag! "g:link", @production_domain + 'products/' + variant.product.slug
xml.tag! "g:image_link", variant.first_image.attachment.url(:product).gsub(/^\//, 'http:/') if variant.first_image
xml.tag! "g:condition", "new"
xml.tag! "g:availability", @in_stock.include?(variant.id) ? 'in stock' : 'out of stock'
xml.tag! "g:price", "#{variant.default_price.display_amount.money} #{variant.default_price.currency}"
xml.tag! "g:mpn", variant.sku.to_s
xml.tag! "g:shipping_weight", variant.weight.to_s
xml.tag! "g:item_group_id", variant.master.sku.to_s if Spree::GoogleMerchant::Manager.include_variants?
@properties[variant.product].each do |key, value|
  xml.tag! "g:#{key}", value if value
end
Spree::GoogleMerchant::Manager.option_values_for(variant).each do |key, value|
  xml.tag! "g:#{key}", value
end
