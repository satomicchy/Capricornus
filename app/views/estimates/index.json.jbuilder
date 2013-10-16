json.array!(@estimates) do |estimate|
  json.extract! estimate, :number, :title, :deadline, :requirement, :custom_id, :memo, :summary
  json.url estimate_url(estimate, format: :json)
end
