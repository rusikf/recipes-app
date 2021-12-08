file = File.open(Rails.root.join('recipes.json'), 'r')

invalid_json = file.read # required commas in json

recipes_rows = invalid_json.split("\n").map do |row|
  JSON.parse(row)
rescue StandardError
  nil
end.compact
recipes_rows.take(10).each do |row_string|
  row = row_string.with_indifferent_access
  recipe = Recipe.find_or_initialize_by(name: row[:name])
  recipe.assign_attributes(
    image: row[:image].presence,
    ingredients: row[:ingredients].presence,
    rate: row[:rate].presence,
    budget: row[:budget],
    author_tip: row[:author_tip].presence,
    author: row[:author].present? ? Profile.find_or_create_by!(name: row[:author]) : nil
  )
  recipe.save!
  row[:tags].each do |tag|
    tag_model = Tag.find_or_create_by!(title: tag)
    recipe.tags << tag_model
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
