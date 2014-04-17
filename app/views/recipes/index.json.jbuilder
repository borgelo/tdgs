json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :ingress, :body, :prepare_time, :cooking_time, :servings
  json.url recipe_url(recipe, format: :json)
end
