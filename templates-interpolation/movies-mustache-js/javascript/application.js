import Mustache from "mustachejs";

const url = 'http://www.omdbapi.com/?s=harry potter&apikey=adf1f2d7';
const container = document.getElementById('results');
const template = document.getElementById('movieCardTemplate').innerHTML

fetch(url)
  .then(response => response.json())
  .then(data => {
    console.log(data);
    const result = Mustache.render(template, data);
    container.innerHTML += result;
  })
  