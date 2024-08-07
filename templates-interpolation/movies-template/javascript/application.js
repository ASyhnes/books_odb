const template = document.getElementById('movieCardTemplate');
const url = 'http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7';
const container = document.getElementById('results');

fetch(url)
  .then(response => response.json())
  .then(data => {
    const films = data.Search;
    films.forEach(film => {
      const clone = template.content.cloneNode(true);
      clone.querySelector('img').src = film.Poster
      clone.querySelector('h2').innerText = film.Title
      clone.querySelector('p').innerText = film.Year
      clone.querySelector('a').href = `https://www.imdb.com/title/${film.imdbID}`
      container.appendChild(clone);
    });
  })