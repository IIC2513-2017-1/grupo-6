json.extract! user, :id, :email, :username, :name, :last_name, :address, :phone_number, :is_admin, :created_at, :updated_at
json.url user_url(user, format: :json)
