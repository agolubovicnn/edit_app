json.array!(@characters) do |character|
  json.extract! character, :id, :char_name, :image, :user_id
  json.url character_url(character, format: :json)
end
