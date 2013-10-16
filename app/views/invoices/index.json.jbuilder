json.array!(@invoices) do |invoice|
  json.extract! invoice, :number, :ask_on, :deadline, :custom_id, :memo, :summary
  json.url invoice_url(invoice, format: :json)
end
