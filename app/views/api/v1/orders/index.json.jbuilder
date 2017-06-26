
json.array! @orders do |order|
  json.href api_v1_order_url(order)
  json.id order.id
  json.total_cost order.total_cost
end
