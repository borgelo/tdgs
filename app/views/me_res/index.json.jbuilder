json.array!(@me_res) do |me_re|
  json.extract! me_re, :id, :recipe, :meal
  json.url me_re_url(me_re, format: :json)
end
