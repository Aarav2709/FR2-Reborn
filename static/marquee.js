function updateMarquees() {
  document.querySelectorAll(".marquee").forEach((container) => {
    const text = container.firstElementChild;
    if (!text) return;

    const style = getComputedStyle(container);
    const paddingLeft = parseFloat(style.paddingLeft);
    const paddingRight = parseFloat(style.paddingRight);

    const containerInnerWidth =
      container.clientWidth - paddingLeft - paddingRight;

    const textWidth = text.offsetWidth;

    text.style.setProperty("--text-width", `${textWidth}`);
    text.style.setProperty("--container-width", `${containerInnerWidth}`);

    container.classList.toggle(
      "overshoot-row",
      textWidth > containerInnerWidth,
    );
  });
}

window.addEventListener("load", updateMarquees);
window.addEventListener("resize", updateMarquees);
