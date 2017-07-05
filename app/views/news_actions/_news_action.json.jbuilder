json.extract! news_action, :id, :title, :description, :image_url, :date, :created_at, :updated_at
json.url news_action_url(news_action, format: :json)
