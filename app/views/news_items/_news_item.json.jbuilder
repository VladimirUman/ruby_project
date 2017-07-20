json.extract! news_item, :id, :title, :description, :image_url, :date, :created_at, :updated_at
json.url news_item_url(news_item, format: :json)
