const audioButtons = document.querySelectorAll(".audio");

audioButtons.forEach((button) => {
  button.addEventListener("click", (event) => playAudio(button.dataset.audio));
});

function playAudio(url) {
  new Audio(url).play();
}
