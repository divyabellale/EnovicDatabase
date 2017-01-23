json.array!(@fee_statuses) do |fee_status|
  json.extract! fee_status, :id, :amount_paid, :paid_date
  json.url fee_status_url(fee_status, format: :json)
end
