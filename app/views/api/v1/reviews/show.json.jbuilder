
json.review do
  json.id @review.id
  json.content @review.content
  json.score @review.score
  json.product do
    json.id @review.product.id
    json.name @review.product.name
    json.href api_v1_product_url(@review.product)
  end
  json.user do
    json.id @review.user.id
    json.username @review.user.username
  end
end
