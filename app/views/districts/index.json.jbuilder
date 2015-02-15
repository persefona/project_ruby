json.array!(@districts) do |district|
  json.extract! district, :id, :number, :voter, :invalid_vote, :ballot
  json.url district_url(district, format: :json)
end
