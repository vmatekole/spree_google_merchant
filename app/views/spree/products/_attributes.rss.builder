if value.respond_to?(:keys)
  xml.tag! key do
    value.each do |sub_key, sub_value|
      xml << render(:partial => 'attributes', :locals => { key: sub_key, value: sub_value })
    end
  end
else
  xml.tag! "g:#{key}", value if value
end
