json.array!(@journals) do |journal|
  json.extract! journal, :content, :city, :custom_id, :complete, :invoice_id, :user_id
  json.url journal_url(journal, format: :json)
  json.start journal.start_at.strftime("%a %b %d %T %Z %Y")
  json.end journal.finish_at.strftime("%a %b %d %T %Z %Y")
end
