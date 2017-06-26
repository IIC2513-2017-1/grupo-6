
json.question do
  json.id @question.id
  json.content @question.content
  json.product do
    json.id @question.product.id
    json.name @question.product.name
    json.href api_v1_product_url(@question.product)
  end
  json.user do
    json.id @question.user.id
    json.username @question.user.username
  end
  json.answers do
    json.array! @question.answers do |answer|
      json.id answer.id
      json.href api_v1_answer_url(answer)
      json.content answer.content
    end
  end
end
