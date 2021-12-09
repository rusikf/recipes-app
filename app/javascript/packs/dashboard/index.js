import React, { useState, useEffect } from 'react'
import RecipesTable from './RecipesTable'
import axios from 'axios'

export default function RecipesDashboard() {
  const [filters, setFilters] = useState({})
  const [recipes, setRecipes] = useState([])

  const setIngredientFilter = (word) => {
    const newFilters = { ...filters, by_ingredient: word }
    setFilters(newFilters)
  }

  useEffect(() => {
    async function fetchRecipes() {
      const items = await axios.get('/api/recipes', { params: filters }).then(response => response.data)
      setRecipes(items)
    }
    fetchRecipes()
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [filters])

  return (
    <main>
      <section className="container">
        <div className="row pt-5 pb-3">
          <div className="col-lg-6 col-md-8">
            <h1 className="fw-light">Latest 30 recipes</h1>
            <form className="row row-cols-lg-auto align-items-center">
              <div className="col-12">
                <div className="input-group">
                  <input type="text" value={filters.by_ingredient} onChange={e => setIngredientFilter(e.target.value)} className="form-control" placeholder="Write ingredients (ex: grasse, riz) ..." />
                </div>
              </div>

              <div className="col-12">
                <button type="submit" className="btn btn-primary">Search { filters.by_ingredient }</button>
              </div>
            </form>
          </div>
        </div>
      </section>

      <RecipesTable recipes={recipes}/>
    </main>
  )
}
