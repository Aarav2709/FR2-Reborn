const closable = document.querySelectorAll("details.closable");

closable.forEach((detail) => {
  detail.addEventListener("toggle", () => {
    if (detail.open) setTargetDetail(detail);
  });
});

function setTargetDetail(targetDetail) {
  closable.forEach((detail) => {
    if (detail !== targetDetail) {
      detail.open = false;
    }
  });
}

document.addEventListener("click", function (event) {
  const isClickInsideDetail = [...closable].some((detail) =>
    detail.contains(event.target),
  );

  if (!isClickInsideDetail) {
    closable.forEach((detail) => {
      detail.open = false;
    });
  }
});

const expandSidebar = document.getElementById("expand-sidebar");
const mainContent = document.getElementById("main-content");

mainContent.addEventListener("click", () => {
  if (expandSidebar.checked) expandSidebar.checked = false;
});
