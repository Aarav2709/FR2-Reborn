const main = document.querySelector("#main-content");

main.addEventListener("animationend", () => {
  const hash = decodeURIComponent(location.hash);
  if (
    ["#↑", "#↓", "#←", "#→", "#up", "#down", "#left", "#right"].includes(hash)
  ) {
    history.replaceState(null, "", " ");
  }
});
