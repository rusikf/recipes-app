module Api
  class RecipesController < ApplicationController
    def index
      rel = ::RecipesRepository.new(by_ingredient: params[:by_ingredient]).list
      represented = rel.map { |model| ::RecipesRepresenter.new(model).call }
      render json: represented
    end
  end
end
