json.extract! post, :id, :content, :image, :youtube_url, :created_at, :updated_at
json.url post_url(post, format: :json)
