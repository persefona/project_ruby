json.array!(@distrcts) do |distrct|
  json.extract! distrct, :id, :number, :voter, :invalid_vote, :ballot
  json.url distrct_url(distrct, format: :json)
end
