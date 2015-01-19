json.array!(@experiences) do |experience|
  json.extract! experience, :id, :title, :description, :place
  json.url experience_url(experience, format: :json)
end
