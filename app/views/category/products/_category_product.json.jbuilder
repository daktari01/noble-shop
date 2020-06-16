json.extract! category_product, :id, :subtype, :price, :quantity, :category_id, :created_at, :updated_at
json.url category_product_url(category_product, format: :json)
