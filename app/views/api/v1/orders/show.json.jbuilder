
json.order do
  json.id @order.id
  json.total_cost @order.total_cost
  json.user do
    json.id @order.user.id
    json.username @order.user.username
  end
  json.products do
    json.array! @order.ordered_products do |ordered_product|
      json.id  ordered_product.product.id
      json.name ordered_product.product.name
      json.href api_v1_product_url(ordered_product.product)
      json.prize ordered_product.product.prize
      json.quantity ordered_product.quantity
    end
  end
end
