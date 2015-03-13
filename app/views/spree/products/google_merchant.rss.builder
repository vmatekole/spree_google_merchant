xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"

xml.rss "version" => "2.0", "xmlns:g" => "http://base.google.com/ns/1.0" do
  xml.channel do
    xml.title Spree::GoogleMerchant::Config[:google_merchant_title]
    xml.description Spree::GoogleMerchant::Config[:google_merchant_description]

    @production_domain = Spree::GoogleMerchant::Config[:production_domain]
    xml.link @production_domain

    @items.each do |item|
       if Spree::GoogleMerchant::Manager.include_variants?
         xml.item do
           xml << render(:partial => 'product_attributes', :locals => { :variant => item })
         end
       else
        xml.item do
          xml << render(:partial => 'product_attributes', :locals => { :variant => item.master })
        end
       end
    end
  end
end
