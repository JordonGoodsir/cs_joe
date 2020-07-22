json.extract! listing, :id, :selling_price, :buyer_id, :seller_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
