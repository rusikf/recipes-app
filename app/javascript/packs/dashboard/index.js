import React from 'react'

export default function RecipesDashboard() {
  return (
    <main>
      <section class="container">
        <div class="row pt-5 pb-3">
          <div class="col-lg-6 col-md-8">
            <h1 class="fw-light">Latest 30 recipes</h1>
            <form class="row row-cols-lg-auto align-items-center">
              <div class="col-12">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Write ingredients here ..." />
                </div>
              </div>

              <div class="col-12">
                <button type="submit" class="btn btn-primary">Search</button>
              </div>
            </form>
          </div>
        </div>
      </section>

      <div class="album bg-light">
        <div class="container">

          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col">
              <div class="card shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/></svg>

                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  )
}
