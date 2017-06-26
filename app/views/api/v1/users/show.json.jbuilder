
json.user do
  json.id @user.id
  json.email @user.email
  json.username @user.username
  json.name @user.name
  json.last_name @user.last_name
  json.address @user.address
  json.phone_number @user.phone_number
  json.reviews do
    json.array! @user.reviews do |review|
      json.href api_v1_review_url(review)
      json.id review.id
      json.content review.content
      json.score review.score
      json.product_id review.product_id
    end
  end
  json.questions do
    json.array! @user.questions do |question|
      json.href api_v1_question_url(question)
      json.id question.id
      json.content question.content
      json.product_id question.product_id
    end
  end
  json.answers do
    json.array! @user.answers do |answer|
      json.href api_v1_answer_url(answer)
      json.id answer.id
      json.content answer.content
      json.question_id answer.question_id
    end
  end
  json.orders do
    json.array! @user.orders do |order|
      json.href api_v1_order_url(order)
      json.id order.id
      json.total_cost order.total_cost
    end
  end
end
