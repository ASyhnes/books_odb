const GARAGE = 'lapoulenoire';
const url = `https://garage.api.lewagon.com/lapoulenoire/cars`

// PREMIERE PARTIE /////////////////////////////////////////////////////////////

// Récupérer les éléments dont on a besoin:
// - La div de class .cars-list
const cars = document.querySelector(".cars-list")

// fonction pour actualiser la liste des voitures
const refreshCars = () => {
  // requete GET pour récupérer les voitures
  fetch(url)
  .then(response => response.json())
  .then(data => {
    cars.innerHTML = ' ';
    // Itérer sur l'array des voitures
    data.forEach(car => {
      // rajouter chaque voiture dans le DOM
      cars.innerHTML += `<div class="car">
        <div class="car-image">
          <img src="http://loremflickr.com/280/280/${car.brand}${car.model}" />
        </div>
        <div class="car-info">
          <h4>${car.brand} - ${car.model}</h4>
          <p><strong>Owner:</strong> ${car.owner}</p>
          <p><strong>Plate:</strong> ${car.plate}</p>
        </div>
      </div>`
    })
  });
}

refreshCars();

// DEUXIEME PARTIE /////////////////////////////////////////////////////////////

// La requete doit avoir attributs suivants:
// verb: POST
// url: https://garage.api.lewagon.com/:garage/cars
// headers: Content-Type: application/json
// body:
//   {
//     "brand": "PEUGEOT",
//     "model": "106",
//     "owner": "ssaunier",
//     "plate": "123AZ56"
//   }

// Récupérer les élts dont on a besoin
// le formulaire (.car-form)
const form = document.querySelector(".car-form");

// fonction de rappel de l'event listener du form
const onSubmit = (event) => {
  event.preventDefault();
  const formData = new FormData(event.currentTarget)
  const myCar = Object.fromEntries(formData)
  const option = {
    method: 'POST',
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(myCar)
  };
  fetch(url, option)
  refreshCars()
}

// event listener
form.addEventListener('submit', onSubmit);