json.array!(@invoices) do |invoice|
  json.extract! invoice, :number, :ask_on, :deadline, :customer_id, :memo, :summary
  json.url invoice_url(invoice, format: :json)
end
