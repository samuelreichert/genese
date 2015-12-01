json.array!(@tutorials) do |tutorial|
  json.extract! tutorial, :id
  json.url tutorial_url(tutorial, format: :json)
end
