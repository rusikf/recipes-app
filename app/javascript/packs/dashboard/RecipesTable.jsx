import React from 'react'
import placeholder from '../images/recipe-placeholder.png'

export default function RecipesTable(props) {
  const Cols = props.recipes.map(recipe => {
    return (
      <div key={recipe.id} className="col">
        <div className="card h-100 shadow-sm">
          { recipe.image &&
            <img src={recipe.image} class="card-img-top" alt="Recipe Image"></img>
          }
          { !recipe.image &&
            <img src={placeholder} class="card-img-top" alt="Recipe Image"></img>
          }
          <div className="card-body">
            <p className="card-text">{ recipe.name }</p>
            <p className="card-text">Ingredients: { recipe.ingredients.join(', ') }</p>
            <div className="d-flex justify-content-between align-items-center">
              <small className="text-muted">Budget: { recipe.budget }</small>
            </div>
            <div className="d-flex justify-content-between align-items-center">
              <small className="text-muted">Author: { recipe.author_name }</small>
            </div>
            {
              recipe.rate && <div className="d-flex justify-content-between align-items-center">
                <small className="text-muted">Rate: { recipe.rate }</small>
              </div>
            }
            {
              recipe.author_tip && <div className="d-flex justify-content-between align-items-center">
                <small className="text-muted">Author tip: { recipe.author_tip }</small>
              </div>
            }
          </div>
          <div class="card-footer">
            { recipe.tags.map(tag => <span class="badge bg-primary mx-1 ">{tag}</span> ) }
          </div>
        </div>
      </div>
    )
  })

  return (
    <div className="album bg-light">
      <div className="container">
        <div  className="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-2">
          { Cols }
        </div>
      </div>
    </div>
  )
}