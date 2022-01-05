class RecipesRepository
  LIMIT = 30

  def initialize(by_ingredient: nil, by_rate: nil)
    @by_ingredient = by_ingredient
    @by_rate = by_rate
  end

  attr_reader :by_ingredient, :by_rate

  def list
    rel = Recipe
    rel = filter_by_ingredient(rel) if by_ingredient.present?
    rel = filter_by_rate(rel) if by_rate.present?
    rel = by_ingredient ? rel.order('RANK DESC') : rel.ordered
    rel.limit(LIMIT)
  end

  private

  def filter_by_ingredient(rel)
    searchable_field = "to_tsvector('english' , ingredients::text)"
    query_field = "websearch_to_tsquery('english', '#{by_ingredient}')"

    rel.select("
      ts_rank(
       #{searchable_field},
       #{query_field}
      ) as rank,
        recipes.*
    ").where("#{searchable_field} @@ #{query_field}")
  end

  def filter_by_rate(rel)
    rel.where(rate: by_rate)
  end
end
