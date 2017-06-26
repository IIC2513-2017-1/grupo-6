
json.answer do
  json.id @answer.id
  json.content @answer.content
  json.question do
    json.id @answer.question.id
    json.user_id @answer.question.user_id
    json.product_id @answer.question.product_id
    json.href api_v1_question_url(@answer.question)
  end
  json.user do
    json.id @answer.user.id
    json.username @answer.user.username
  end
end
