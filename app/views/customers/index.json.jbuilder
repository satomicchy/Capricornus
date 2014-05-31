json.array!(@customs) do |custom|
  json.extract! custom, :name, :address, :tel, :fax, :president, :zip, :email
  json.url custom_url(custom, format: :json)
end
