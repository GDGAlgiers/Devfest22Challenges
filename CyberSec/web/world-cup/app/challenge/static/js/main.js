function capitalize(str) {
  return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
}

function fetchCountry(countryName) {
  fetch("/", {
    method: "POST",
    body: JSON.stringify({
      "country.name": countryName,
    }),
    headers: { "Content-Type": "application/json" },
  })
    .then((resp) => resp.json())
    .then((data) => {
      output = document.getElementById("output");
      if (data.error) {
        output.innerHTML = data.error;
      } else {
        output.innerHTML = `Go Go ${capitalize(
          data.name
        )}!\n<img id="country-flag" width=400 src="https://cdn.jsdelivr.net/gh/hampusborgos/country-flags@main/svg/${data.code.toLowerCase()}.svg">`;
      }
    });
}

document.getElementById("form").addEventListener("submit", (e) => {
  e.preventDefault();

  fetchCountry(document.querySelector("input[type=text]").value);
});
