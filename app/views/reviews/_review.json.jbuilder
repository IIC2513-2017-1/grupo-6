json.extract! review, :id, :content, :score, :created_at, :updated_at
json.url review_url(review, format: :json)
