
json.array! @answers do |answer|
  json.href api_v1_answer_url(answer)
  json.id answer.id
  json.content answer.content
  json.question_id answer.question_id
  json.user_id answer.user_id
end
