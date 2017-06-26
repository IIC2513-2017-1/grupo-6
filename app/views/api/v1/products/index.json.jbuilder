
json.array! @products do |product|
  json.href api_v1_product_url(product)
  json.id product.id
  json.name product.name
  json.description product.description
  json.price product.prize
  json.stock product.stock
  json.discount product.discount
end
