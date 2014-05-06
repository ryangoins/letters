json.array!(@letters) do |letter|
  json.extract! letter, :id, :recipient_first_name, :recipient_last_name, :recipient_street, :recipient_city, :recipient_state, :recipient_zip, :content
  json.url letter_url(letter, format: :json)
end
