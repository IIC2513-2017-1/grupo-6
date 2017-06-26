
json.array! @reviews do |review|
  json.href api_v1_review_url(review)
  json.id review.id
  json.content review.content
  json.score review.score
  json.product_id review.product_id
  json.user_id review.user_id
end
