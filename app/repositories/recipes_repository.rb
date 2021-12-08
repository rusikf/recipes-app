class RecipesRepository
  LIMIT = 30

  def initialize(by_ingredient: nil)
    @by_ingredient = by_ingredient
  end

  attr_reader :by_ingredient

  def list
    rel = Recipe.ordered
    rel = filter_by_ingredient(rel) if by_ingredient.present?
    rel.limit(LIMIT)
  end

  private

  def filter_by_ingredient(rel)
    rel.where("array_to_string(ingredients, '||') ILIKE :name", name: "%#{by_ingredient}%")
  end
end
