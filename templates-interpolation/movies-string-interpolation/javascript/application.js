const url = 'http://www.omdbapi.com/?apikey=d420fcf5&s=harry%20potter';
const filmsContainer = document.getElementById('results');

fetch(url)
  .then(response => response.json())
  .then(data => {
    const films = data.Search
    films.forEach(film => {
      const movieCard = `
      <div class='col-3'>
        <div class="card" style="width: 18rem;">
          <img src="${film.Poster}" class="card-img-top" alt="${film.Title} poster">
          <div class="card-body">
            <h2 class="card-title">${film.Title}</h2>
            <p class="card-text">${film.Year}</p>
            <a href="https://www.imdb.com/title/${film.imdbID}" class="btn btn-primary" target="_blank">Go on IMDB</a>
          </div>
        </div>
      </div>`
      filmsContainer.insertAdjacentHTML('beforeend', movieCard)
    });
  })