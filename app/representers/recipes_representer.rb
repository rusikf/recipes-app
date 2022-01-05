class RecipesRepresenter
  def initialize(model)
    @model = model
  end

  delegate :id, :name, :image, :description, :rate, :budget, :author_tip, :ingredients, to: :model
  attr_reader :model

  def call
    {
      id: id,
      name: name,
      image: image,
      ingredients: ingredients,
      rate: rate,
      budget: budget,
      author_name: model.author&.name,
      author_tip: author_tip,
      tags: model.tags.ordered.pluck(:title)
    }
  end
end
