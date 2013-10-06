json.array!(@banks) do |bank|
  json.extract! bank, :name, :branch, :type, :number
  json.url bank_url(bank, format: :json)
end
