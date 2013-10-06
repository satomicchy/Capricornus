json.array!(@companies) do |company|
  json.extract! company, :name, :address, :tel, :fax, :president, :zip, :email
  json.url company_url(company, format: :json)
end
