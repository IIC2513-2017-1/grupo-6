json.extract! coupon, :id, :code, :type, :discount, :redeems_available, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
