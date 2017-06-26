
json.product do
  json.href api_v1_product_url(@product)
  json.id @product.id
  json.name @product.name
  json.description @product.description
  json.details @product.details
  json.price @product.prize
  json.stock @product.stock
  json.discount @product.discount
  json.images do
    json.array! @product.images do |image|
      json.href image.url
    end
  end
  json.reviews do
    json.array! @product.reviews do |review|
      json.href api_v1_review_url(review)
      json.id review.id
      json.product_id review.product_id
      json.username review.user.username
      json.content review.content
      json.score review.score
    end
  end
  json.questions do
    json.array! @product.questions do |question|
      json.href api_v1_question_url(question)
      json.id question.id
      json.content question.content
    end
  end
end
