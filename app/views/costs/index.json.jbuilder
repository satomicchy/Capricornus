json.array!(@costs) do |cost|
  json.extract! cost, :count, :unit, :unit_price, :journal_id
  json.url cost_url(cost, format: :json)
end
