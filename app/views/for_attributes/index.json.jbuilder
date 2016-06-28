json.array!(@for_attributes) do |for_attribute|
  json.extract! for_attribute, :id, :name, :value, :image, :character_id
  json.url for_attribute_url(for_attribute, format: :json)
end
