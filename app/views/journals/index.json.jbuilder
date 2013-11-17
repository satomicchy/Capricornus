json.array!(@journals) do |journal|
  json.extract! journal, :work_on, :content, :city, :custom_id, :complete, :invoice_id, :user_id
  json.url journal_url(journal, format: :json)
end
