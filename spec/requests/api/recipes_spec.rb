require 'rails_helper'

RSpec.describe 'Api::Recipes', type: :request do
  describe 'GET /api/recipes' do
    let(:recipe) { FactoryBot.create(:recipe) }

    before do
      recipe
    end

    it 'return recipes' do
      get '/api/recipes'
      expect(response).to have_http_status(200)
      api_recipes = JSON.parse(response.body)
      expect(api_recipes.size).to eq(1)
    end

    it 'return valid recipes format' do
      get '/api/recipes'
      api_recipe = JSON.parse(response.body)[0]
      fields = %w[author_name author_tip budget id image ingredients name rate tags]
      expect(api_recipe.keys).to match_array(fields)
    end

    context 'filters' do
      context 'by_rate' do
        let(:best_rate_recipes) { FactoryBot.create_list(:recipe, 4, rate: 5) }
        let(:invalid_recipe) { FactoryBot.create(:recipe) }

        before do
          best_rate_recipes
          invalid_recipe
        end

        it 'filter by ingredient name' do
          get '/api/recipes', params: { by_rate: 5 }
          api_recipes = JSON.parse(response.body)
          expect(api_recipes.size).to eq(4)
        end
      end

      context 'by_ingredient' do
        let(:potato_recipe1) { FactoryBot.create(:recipe, ingredients: ['Potato and Tomato', 'with best tomato']) }
        let(:potato_recipe2) { FactoryBot.create(:recipe, ingredients: ['One tomato', 'Eggs']) }

        let(:invalid_recipe) { FactoryBot.create(:recipe, ingredients: ['Bread']) }

        before do
          invalid_recipe
          potato_recipe2
          potato_recipe1
        end

        it 'filter by ingredient name' do
          get '/api/recipes', params: { by_ingredient: 'tomato' }
          api_recipes = JSON.parse(response.body)
          expect(api_recipes.size).to eq(2)
          expect(api_recipes.map { |recipe| recipe['id'] } ).to eq([potato_recipe1.id, potato_recipe2.id])
        end
      end
    end
  end
end
