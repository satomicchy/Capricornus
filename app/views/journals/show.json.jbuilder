json.extract! @journal, :content, :city, :customer_id, :complete, :invoice_id, :user_id, :created_at, :updated_at

json.start_y @journal.start_at.year
json.start_m @journal.start_at.month
json.start_d @journal.start_at.day
json.start_h @journal.start_at.hour
json.start_mm @journal.start_at.min

json.finish_y @journal.finish_at.year
json.finish_m @journal.finish_at.month
json.finish_d @journal.finish_at.day
json.finish_h @journal.finish_at.hour
json.finish_mm @journal.finish_at.min

json.id @journal.id