json.array!(@referencedbooks) do |referencedbook|
  json.extract! referencedbook, :id
  json.url referencedbook_url(referencedbook, format: :json)
end
