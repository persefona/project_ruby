json.array!(@committees) do |committee|
  json.extract! committee, :id, :name, :shortname, :number_of_list, :logo
  json.url committee_url(committee, format: :json)
end
