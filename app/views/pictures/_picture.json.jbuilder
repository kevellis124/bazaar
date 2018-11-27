json.extract! picture, :id, :filename, :content_type, :file_contents, :created_at, :updated_at
json.url picture_url(picture, format: :json)
