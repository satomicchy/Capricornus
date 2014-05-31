json.array!(@customers) do |customer|
  json.extract! customer, :name, :address, :tel, :fax, :president, :zip, :email
  json.url customer_url(customer, format: :json)
end
