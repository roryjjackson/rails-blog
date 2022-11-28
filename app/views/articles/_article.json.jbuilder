json.extract! article, :id, :title, :location, :content, :latitude, :longitude, :category, :created_at, :updated_at
json.url article_url(article, format: :json)
