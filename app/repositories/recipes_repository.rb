class RecipesRepository
  LIMIT = 30

  def initialize(by_ingredient: nil, by_rate: nil)
    @by_ingredient = by_ingredient
    @by_rate = by_rate
  end

  attr_reader :by_ingredient, :by_rate

  def list
    rel = Recipe.ordered
    rel = filter_by_ingredient(rel) if by_ingredient.present?
    rel = filter_by_rate(rel) if by_rate.present?

    rel.limit(LIMIT)
  end

  private

  def filter_by_ingredient(rel)
    rel.where("array_to_string(ingredients, '||') ILIKE :name", name: "%#{by_ingredient}%")
  end

  def filter_by_rate(rel)
    rel.where(rate: by_rate)
  end
end
