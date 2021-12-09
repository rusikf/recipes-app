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

  const setRateFilter = (rate) => {
    const newFilters = { ...filters, by_rate: rate }
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
          <div className="col-xs-10">
            <h1 className="fw-light">Latest 30 recipes</h1>
            <form className="row row-cols-lg-auto">
              <div className="col-10">
                <div className="input-group">
                  <input type="text" value={filters.by_ingredient || ''} onChange={e => setIngredientFilter(e.target.value || null)} className="form-control" placeholder="Write ingredients (ex: grasse, riz) ..." />
                </div>
              </div>
                <div className="col-2">

                <div className="input-group">
                  <select value={ filters.by_rate || ''} onChange={e => setRateFilter(e.target.value || null)} className="form-select" aria-label="Filter by rate">
                  <option value=''>Choose Rate</option>
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                </select>
                </div>
              </div>
              <div className="col-12">
                <button type="submit" className="btn btn-primary">Search</button>
              </div>
            </form>
          </div>
        </div>
      </section>

      <RecipesTable recipes={recipes}/>
    </main>
  )
}
