module Api
  class RecipesController < ApplicationController
    def index
      render json: { text: 'Hellow world' }
    end
  end
end
