
json.array! @questions do |question|
  json.href api_v1_question_url(question)
  json.id question.id
  json.content question.content
  json.product_id question.product_id
  json.user_id question.user_id
end
