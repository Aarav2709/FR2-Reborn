// Slider
var slider = document.getElementById("range");
var output = document.getElementById("range-value");
output.innerHTML = slider.value;

slider.oninput = function () {
  output.innerHTML = this.value;
}

const sliders = {
  h: document.getElementById("range-h"),
  s: document.getElementById("range-s"),
  l: document.getElementById("range-l"),
};

const outputs = {
  h: document.getElementById("range-h-value"),
  s: document.getElementById("range-s-value"),
  l: document.getElementById("range-l-value"),
};

function getCSSVar(name) {
  return getComputedStyle(document.documentElement).getPropertyValue(name).trim();
}

function updateAccentColor() {
  const h = sliders.h.value;
  const s = sliders.s.value + "%";
  const l = sliders.l.value + "%";

  document.documentElement.style.setProperty("--accent-h", h);
  document.documentElement.style.setProperty("--accent-s", s);
  document.documentElement.style.setProperty("--accent-l", l);
  document.documentElement.style.setProperty("--accent-color", `hsl(${h}, ${s}, ${l})`);

  outputs.h.textContent = h;
  outputs.s.textContent = s;
  outputs.l.textContent = l;
}

// Initialize sliders with CSS values
Object.keys(sliders).forEach(key => {
  const defaultVar = getCSSVar(`--accent-${key}`);
  if (defaultVar) {
    sliders[key].value = parseFloat(defaultVar);
    outputs[key].textContent = sliders[key].value;
  }

  sliders[key].addEventListener("input", updateAccentColor);
});

updateAccentColor();
