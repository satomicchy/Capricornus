json.array!(@journals) do |journal|
  json.extract! journal, :work_on, :content, :city, :custom_id, :travel_expenses, :complete, :invoice_id, :user_id
  json.url journal_url(journal, format: :json)
end
